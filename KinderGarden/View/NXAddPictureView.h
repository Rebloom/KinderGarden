//
//  NXAddPictureView.h
//  OAConnectStore
//
//  Created by haonanchen on 16/4/21.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NXMacro.h"

@protocol NXAddPictureViewDelegate <NSObject>

@required
- (void)imageViewClickedAtIndex:(NSInteger)index;

- (void)imageViewDeleteAtIndex:(NSInteger)index;

@end

@interface NXAddPictureView : UIView <UIGestureRecognizerDelegate>
{
    CGPoint currentPoint;
    CGPoint nextPoint;
    
    NSInteger fromIndex;
    NSInteger toIndex;
    
    NSInteger beginFromIndex;
    
    NSMutableArray * _imageArray;
}

@property (nonatomic, strong) NSMutableArray * imageArray;

@property (nonatomic, weak) id <NXAddPictureViewDelegate> delegate;

- (void)reloadPictureViewWithImages;

@end
