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

@interface CoursesViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,CourcesDelegate,UIActionSheetDelegate,UITextFieldDelegate,selectClassDelegate>
{
    UITableView * infoTablView;
    UIScrollView * SV;
    UIButton * fabuBtn;
    
    NSInteger classNum;//用来记录上午有几节课
    
    UIView * bgView;
    UIView * mainView;
    UIButton * hideBtn;
    
    UIView * editView;
    UIView * mainTwoView;
    UIButton * hideTwoBtn;
    UITextField * editTF;
    UIButton * sureBtn;
    UILabel * lineTwoLabel;
    
    
    NSMutableArray * classOneArr;
    NSMutableArray * classTwoArr;
    
    NSInteger recordSection;
    NSInteger recordRow;
    
    SelectClssView * selectView;
}
@end
