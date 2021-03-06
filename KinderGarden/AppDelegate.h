//
//  AppDelegate.h
//  KinderGarden
//
//  Created by haonanchen on 16/5/17.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "HomeViewController.h"
#import "NXGlobalUtil.h"

#import "EMSDK.h"
#import "EaseUI.h"

#import "ThirdPartRequest.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,NXRequestDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) HomeViewController * HVC;
+(AppDelegate *)instance;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

