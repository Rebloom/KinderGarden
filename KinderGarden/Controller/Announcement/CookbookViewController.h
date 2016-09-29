//
//  CookbookViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/8/16.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "SelectClssView.h"
#import "EditView.h"
#import "CookbookCell.h"
#import "TakePhotoView.h"

@interface CookbookViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,selectClassDelegate,editViewDelegate,CookbookDelegate,TakePhotoViewDelegate>
{
    UITableView * infoTableView;
    UIScrollView * SV;
    UIButton * fabuBtn;
    
    NSInteger classNum;//用来记录上午有几节课
    NSInteger recordSection;
    
    NSMutableArray * infoArr;//用来装所有数据  
    
    SelectClssView * selectView;
    EditView * editV;
    NSInteger recordRow;//记录编辑的是哪一行
    
    TakePhotoView * takePhoto;
}

@property (nonatomic, assign) BOOL canEdit;

@end