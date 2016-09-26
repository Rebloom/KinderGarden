//
//  CoursesViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/28.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "CoursesCell.h"
#import "SelectClssView.h"
#import "EditView.h"
@interface CoursesViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,CourcesDelegate,UIActionSheetDelegate,UITextFieldDelegate,selectClassDelegate,editViewDelegate>
{
    UITableView * infoTablView;
    UIScrollView * SV;
    UIButton * fabuBtn;
    
    NSInteger classNum;//用来记录上午有几节课
    NSInteger recordSection;

    NSMutableArray * classOneArr;
    NSMutableArray * classTwoArr;
    
    SelectClssView * selectView;
    EditView * editV;
    NSInteger recordRow;//记录编辑的是哪一行
    
    NSString * selectedWeek;
}
@end
