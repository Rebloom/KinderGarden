//
//  ChildDetailViewController.h
//  KinderGarden
//
//  Created by haonanchen on 16/6/11.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

#import "TakePhotoView.h"

@interface ChildDetailViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource,TakePhotoViewDelegate>
{
    NSMutableArray * infoArray;

    UITableView * infoTable;
    
    NSString * descString;
    
    TakePhotoView * takePhoto;
    
    UIImageView * bgImageView;
}

@end
