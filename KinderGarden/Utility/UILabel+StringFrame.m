//
//  UILabel+StringFrame.m
//  LingJinMaster
//
//  Created by Rebloom on 15/12/17.
//  Copyright (c) 2015年 Rebloom. All rights reserved.
//

#import "UILabel+StringFrame.h"

@implementation UILabel (StringFrame)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = CGSizeZero;
    
    retSize = [self.text boundingRectWithSize:size
                                      options:\
               NSStringDrawingTruncatesLastVisibleLine |
               NSStringDrawingUsesLineFragmentOrigin |
               NSStringDrawingUsesFontLeading
                                   attributes:attribute
                                      context:nil].size;
    return retSize;
}

- (CGSize)boundingRectWithSize:(CGSize)size lineSpacingValue:(NSInteger)_spacing
{
    CGSize retSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:_spacing];//调整行间距
    
    NSDictionary * dict = @{NSFontAttributeName:self.font,
                            NSForegroundColorAttributeName:[UIColor blackColor],
                            NSParagraphStyleAttributeName: paragraphStyle};
    
    retSize = [self.text boundingRectWithSize:size
                                      options:\
               NSStringDrawingTruncatesLastVisibleLine |
               NSStringDrawingUsesLineFragmentOrigin |
               NSStringDrawingUsesFontLeading
                                   attributes:dict
                                      context:nil].size;
    
    return retSize;
}

@end
