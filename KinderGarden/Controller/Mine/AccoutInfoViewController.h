//
//  AccoutInfoViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface AccoutInfoViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UITableView * infoTableView;
    UIImageView * headView;
    UIImageView * iconView;
    UILabel * nameLabel;
    UILabel * phoneLabel;
    UIImagePickerController * imagePicker;
    UIButton * photoBtn;
}

@end
