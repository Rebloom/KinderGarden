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

@interface CookbookViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,selectClassDelegate,editViewDelegate,CookbookDelegate>
{
    UITableView * infoTablView;
    UIScrollView * SV;
    UIButton * fabuBtn;
    
    NSInteger classNum;//用来记录上午有几节课
    NSInteger recordSection;
    
    NSMutableArray * mealArr;
    
    SelectClssView * selectView;
    EditView * editV;
    NSInteger recordRow;//记录编辑的是哪一行
}

@end
