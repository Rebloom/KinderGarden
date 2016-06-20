//
//  NXAddPictureView.m
//  OAConnectStore
//
//  Created by haonanchen on 16/4/21.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#define kTagImageViewGap            15
#define kTagImageViewBeginTag       1024

#import "NXAddPictureView.h"

@implementation NXAddPictureView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _imageArray = [NSMutableArray arrayWithCapacity:16];
    }
    
    return self;
}

- (void)reloadPictureViewWithImages
{
    for (UIView * view in self.subviews)
    {
        [view removeFromSuperview];
    }
    self.frame = CGRectMake(0, self.frame.origin.y, screenWidth, (screenWidth-15)/4*((_imageArray.count-1)/4+1)+15);
    for (int i = 0; i < _imageArray.count; i++)
    {
        UIView * deleteView = [[UIView alloc] initWithFrame:CGRectMake(((screenWidth-kTagImageViewGap)/4*(i%4)+7.5), ((screenWidth-kTagImageViewGap)/4*(i/4))+7.5, (screenWidth-kTagImageViewGap)/4, (screenWidth-kTagImageViewGap)/4)];
        deleteView.tag = kTagImageViewBeginTag+i;
        [self addSubview:deleteView];

        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kTagImageViewGap-7.5, kTagImageViewGap-7.5, (SCREEN_WIDTH-kTagImageViewGap)/4-15, (screenWidth-kTagImageViewGap)/4-15)];
        imageView.userInteractionEnabled = YES;
        [deleteView addSubview:imageView];
        
        UIButton * deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)-10, CGRectGetMinY(imageView.frame)-10, 20, 20)];
        [deleteBtn setBackgroundImage:[UIImage imageNamed:@"deletebtnImage"] forState:UIControlStateNormal];
        [deleteView addSubview:deleteBtn];
        deleteBtn.tag = i;
        NSObject * object = [_imageArray objectAtIndex:i];
        
        if ([object isKindOfClass:[UIImage class]])
        {
            imageView.image = [_imageArray objectAtIndex:i];
        }
        else if ([object isKindOfClass:[NSString class]])
        {
            NSString * urlString = (NSString *)object;
        }
        else
        {
            NSString * urlString = [[_imageArray objectAtIndex:i] objectForKey:@"bigUrl"];
            if (urlString == nil) {
                urlString = [[_imageArray objectAtIndex:i] objectForKey:@"big"];
            }
        }
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerHandler:)];
        tap.cancelsTouchesInView = NO;
        tap.delegate = self;
        [deleteView addGestureRecognizer:tap];
        
        if (i == _imageArray.count-1)
        {
            deleteView.hidden = _imageArray.count == 16;
            deleteBtn.hidden = YES;
        }
        else
        {
            UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerHandler:)];
            [deleteView addGestureRecognizer:longPress];
        }
    }
    UIView * line4 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame), screenWidth, .5)];
    line4.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line4];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSString * touchObject = NSStringFromClass([touch.view class]);
    
    // 这里UIButton的事件被吃掉了，在这里吐出来
    if ([touchObject isEqualToString:@"UIButton"])
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDeleteAtIndex:)])
        {
            [self.delegate imageViewDeleteAtIndex:touch.view.tag];
        }

        return NO;
    }

    return YES;
}

- (void)gestureRecognizerHandler:(UIGestureRecognizer *)gesture
{
    CGPoint  point = [gesture locationInView:self];
    UIView * recognizerView = gesture.view;
    if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
    {
        // 点击了图片
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewClickedAtIndex:)])
        {
            [self.delegate imageViewClickedAtIndex:recognizerView.tag-kTagImageViewBeginTag];
        }
        [self bringSubviewToFront:recognizerView];
        // valuePoint保存最新的移动位置
        currentPoint = recognizerView.center;
    }
    else if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]])
    {
        UILongPressGestureRecognizer * longPress = (UILongPressGestureRecognizer *)gesture;
        if (longPress.state == UIGestureRecognizerStateBegan)
        {
            beginFromIndex = recognizerView.tag - kTagImageViewBeginTag;
            // 开始的时候改变拖动view的外观（放大，改变颜色等）
            [UIView animateWithDuration:0.2 animations:^{
                recognizerView.transform = CGAffineTransformMakeScale(1.3, 1.3);
                recognizerView.alpha = 0.7;
            }];
            
            for (UIView * view in self.subviews)
            {
                for (UIView * subView in view.subviews)
                {
                    if ([subView isKindOfClass:[UIButton class]])
                    {
                        subView.hidden = YES;
                    }
                }
            }
            
            currentPoint = recognizerView.center;
        }
        else if (longPress.state == UIGestureRecognizerStateChanged)
        {
            recognizerView.center = point;
        
            for (UIView * view in self.subviews)
            {
                if (view.tag == kTagImageViewBeginTag+self.imageArray.count-1)
                {
                    return;
                }
                if (CGRectContainsPoint(view.frame, recognizerView.center) && view != recognizerView)
                {
                    fromIndex = recognizerView.tag - kTagImageViewBeginTag;
                    // 需要移动到的位置
                    toIndex = view.tag - kTagImageViewBeginTag;
                    
                    if ((toIndex-fromIndex) > 0)
                    {
                        // 从开始位置移动到结束位置
                        // 把移动view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次类推
                        [UIView animateWithDuration:0.2 animations:^{
                            for (NSInteger i = fromIndex+1; i <= toIndex; i++)
                            {
                                UIView * nextView = [self viewWithTag:kTagImageViewBeginTag+i];
                                nextPoint = nextView.center;
                                nextView.center = currentPoint;
                                currentPoint = nextPoint;
                                nextView.tag--;
                            }
                            recognizerView.tag = kTagImageViewBeginTag + toIndex;
                        }];
                    }
                    // 往前移动
                    else{
                        // 从开始位置移动到结束位置
                        // 把移动view的上一个view移动到记录的view的位置(valuePoint)，并把上一view的位置记为新的nextPoint，并把view的tag值+1,依次类推
                        [UIView animateWithDuration:0.2 animations:^{
                            for (NSInteger i = fromIndex-1; i >= toIndex; i--)
                            {
                                UIView * nextView = [self viewWithTag:kTagImageViewBeginTag+i];
                                nextPoint = nextView.center;
                                nextView.center = currentPoint;
                                currentPoint = nextPoint;
                                nextView.tag++;
                            }
                            recognizerView.tag = kTagImageViewBeginTag + toIndex;
                        }];
                    }
                }
            }
        }
        else if (gesture.state == UIGestureRecognizerStateEnded)
        {
            // 结束时候恢复view的外观（放大，改变颜色等）
            [UIView animateWithDuration:0.2 animations:^{
                recognizerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                recognizerView.alpha = 1;
                recognizerView.center = currentPoint;
            }];
            
            [_imageArray exchangeObjectAtIndex:beginFromIndex withObjectAtIndex:toIndex];
            for (UIView * view in self.subviews)
            {
                for (UIView * subView in view.subviews)
                {
                    if ([subView isKindOfClass:[UIButton class]])
                    {
                        subView.hidden = NO;
                    }
                }
                if (view.tag == kTagImageViewBeginTag+_imageArray.count-1)
                {
                    for (UIView * subView in view.subviews)
                    {
                        if ([subView isKindOfClass:[UIButton class]])
                        {
                            subView.hidden = YES;
                        }
                    }
                }
            }
        }
    }
}

@end
