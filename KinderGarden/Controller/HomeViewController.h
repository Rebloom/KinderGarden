//
//  HomeViewController.h
//  KinderGarden
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "BasicViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

#import "Ivan_UITabBar.h"

typedef enum SELECTEDTAB
{
    TabSelectedFirst = 0,
    TabSelectedSecond,
    TabSelectedThird,
    TabSelectedFourth,
    TabSelectedFifth,
}_SELECTEDTAB;

@interface HomeViewController : BasicViewController
{
    Ivan_UITabBar * tabBarController;
}

@property (nonatomic, retain) Ivan_UITabBar * tabBarController;

- (void)setSelectedTab:(NSInteger)index;
- (void)showTabbar;

@end