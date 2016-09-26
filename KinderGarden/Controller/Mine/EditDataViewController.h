//
//  EditDataViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import <Accelerate/Accelerate.h>
#import "EditView.h"

@interface EditDataViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,editViewDelegate>
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
    
    EditView * edit;
    NSInteger recordRow;//记录编辑的是哪一行
    
    NSMutableArray * infoArray;
}

@end
