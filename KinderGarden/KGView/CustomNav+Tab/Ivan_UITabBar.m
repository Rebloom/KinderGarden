//
//  Ivan_UITabBar.m
//  CustomNavBar+TabBar
//
//  Created by Ivan on 11-5-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ivan_UITabBar.h"
#import "UIBadgeView.h"
#import "GFStaticData.h"
#import "UIImage+UIColor.h"
#define kTabCellWidth  [UIScreen mainScreen].bounds.size.width/5-1

@implementation Ivan_UITabBar
@synthesize buttons;
@synthesize imageArr;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"hideCustomTabBar" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideCustomTabBar)
                                                 name: @"hideCustomTabBar"
                                               object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"bringCustomTabBarToFront" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(bringCustomTabBarToFront)
                                                 name: @"bringCustomTabBarToFront"
                                               object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"setBadge" object:nil];

    slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    if (self.buttons.count)
    {
        // 已经有了 不需要再创建了
    }
    else
    {
        [self hideRealTabBar];
        [self customTabBar];
    }
}

- (void)hideRealTabBar{
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            view.hidden = YES;
            break;
        }
    }
}


//自定义tabbar
- (void)customTabBar
{
    CGRect tabBarFrame = CGRectMake(0, screenHeight-49, screenWidth, 49);
    cusTomTabBarView = [[UIImageView alloc] initWithFrame:tabBarFrame];
    cusTomTabBarView.clipsToBounds = NO;
    cusTomTabBarView.backgroundColor = [KBlackColor colorWithAlphaComponent:.95];
//    cusTomTabBarView.image = [UIImage imageNamed:@"bg"];
    cusTomTabBarView.userInteractionEnabled = YES;
    
    //创建按钮
    self.buttons = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*kTabCellWidth, 0, kTabCellWidth, 50);
        btn.tag = i;
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        
        UIViewController * v = [self.viewControllers objectAtIndex:i];
        
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*kTabCellWidth+1, 36, kTabCellWidth, 10)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = v.tabBarItem.title;
        titleLabel.font = NormalFontWithSize(10);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.tag = 1000+i;
        [self.buttons addObject:btn];
        
        UIImageView * imageView = [[UIImageView alloc] initWithImage:v.tabBarItem.image];
        if (i == 2)
        {
            imageView.frame = CGRectMake(i*kTabCellWidth+11, 4.5, 60, 60);
            imageView.center = CGPointMake(titleLabel.center.x, titleLabel.center.y-22);
        }
        else
        {
            imageView.frame = CGRectMake(i*kTabCellWidth+21, 9, 23, 23);
            imageView.center = CGPointMake(titleLabel.center.x, titleLabel.center.y-22);
        }
        imageView.tag = 1000+i;
        
        [cusTomTabBarView addSubview:btn];
        [cusTomTabBarView addSubview:imageView];
        [cusTomTabBarView addSubview:titleLabel];
    }
    [self.view addSubview:cusTomTabBarView];
    [cusTomTabBarView addSubview:slideBg];
}

//切换tabbar
- (void)selectedTab:(UIButton *)button
{
    self.selectedIndex = button.tag;
    
    [self performSelector:@selector(slideTabBg:) withObject:button];
}

//将自定义的tabbar显示出来
- (void)bringCustomTabBarToFront
{
    [self performSelector:@selector(hideRealTabBar)];
    [cusTomTabBarView setHidden:NO];
}

//隐藏自定义tabbar
- (void)hideCustomTabBar
{
    [self performSelector:@selector(hideRealTabBar)];
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.1;
    animation.delegate = self;
    [cusTomTabBarView.layer addAnimation:animation forKey:nil];
}


//动画结束回调
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (anim.duration==0.1)
    {
        [cusTomTabBarView setHidden:YES];
    }
}

//切换滑块位置
- (void)slideTabBg:(UIButton *)btn
{
    [slideBg setImage:[UIImage imageNamed:[imageArr objectAtIndex:btn.tag]]];
    if (btn.tag == 2)
    {
        slideBg.frame = CGRectMake(btn.frame.origin.x+21, btn.frame.origin.y+9, 60, 60);//btn.frame;
        slideBg.center = CGPointMake(btn.center.x+1, btn.center.y-6);
    }
    else
    {
        slideBg.frame = CGRectMake(btn.frame.origin.x+21, btn.frame.origin.y+9, 23, 23);//btn.frame;
        slideBg.center = CGPointMake(btn.center.x+1, btn.center.y-6);
    }
    
    for (UIView * view in cusTomTabBarView.subviews)
    {
        NSInteger viewTag = view.tag-1000;
        if ([view isKindOfClass:[UIImageView class]])
        {
            if (viewTag >= 0)
            {
                if (btn.tag == viewTag)
                {
                    view.hidden = YES;
                }
                else
                {
                    view.hidden = NO;
                }
            }
        }
        else if ([view isKindOfClass:[UILabel class]])
        {
            UILabel * labelView = (UILabel *)view;
            if (viewTag >= 0)
            {
                if (btn.tag == viewTag)
                {
                    labelView.textColor = KPurpleColor;
                }
                else
                {
                    labelView.textColor = KFontColorA;
                }
            }
        }
    }
}

//设置badge
- (void)setBadge:(NSString *)badge
{
    NumLabel.text = badge;
    
    if ([badge integerValue] > 0)
    {
        NumLabel.hidden = NO;
    }
    else
    {
        NumLabel.hidden = YES;
    }
}


@end
