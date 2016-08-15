//
//  EditDataViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import <Accelerate/Accelerate.h>

@interface EditDataViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    NSString * cityStr;
    
    NSMutableArray * rightOneArr;
   
    UITableView * infoTableView;
    UIImagePickerController * imagePicker;
    UIImageView * headView;
    UIImageView * iconView;
    UILabel * nameLabel;
    UILabel * phoneLabel;
    UIButton * photoBtn;
}

@end
