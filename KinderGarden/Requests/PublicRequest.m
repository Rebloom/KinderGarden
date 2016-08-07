//
//  PublicRequest.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "PublicRequest.h"

@implementation PublicRequest

+ (void)publishPublicInfoWithTitle:(NSString *)title bannerImage:(NSString *)bannerImage content:(NSString *)announcement range:(NSString *)selectrange images:(NSMutableArray *)images videoUrl:(NSString *)videoUrl operatePersonID:(NSString *)personID delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagPublishPublicRequest;
    request.delegate = _delegate;
    
    NSString * imageString = @"";
    for (NSString * str in images)
    {
        imageString = [imageString stringByAppendingString:[NSString stringWithFormat:@"%@,",str]];
    }
    imageString = [imageString substringToIndex:imageString.length-1];
    
    [request.params setObject:title forKey:@"title"];
    [request.params setObject:bannerImage forKey:@"bannerimg"];
    [request.params setObject:announcement forKey:@"announcement"];
    [request.params setObject:selectrange forKey:@"selectrange"];
    [request.params setObject:imageString forKey:@"imags"];
    [request.params setObject:videoUrl forKey:@"voidurls"];
    [request.params setObject:personID forKey:@"ospersion"];
    
    [request start];
}

+ (void)getPublicListWithPage:(NSString *)page numbers:(NSString *)rows delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagGetPublicListRequest;
    request.delegate = _delegate;
    
    [request.params setObject:page forKey:@"page"];
    [request.params setObject:rows forKey:@"rows"];
    
    [request start];
}

+ (void)savePublicInfoComment:(NSString *)publicID commentPerson:(NSString *)commentID isShow:(BOOL)show commentContent:(NSString *)commentContent delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagCommentPublicRequest;
    request.delegate = _delegate;
    
    [request.params setObject:publicID forKey:@"announid"];
    [request.params setObject:commentID forKey:@"criticsid"];
    [request.params setObject:@"1" forKey:@"isdispy"];
    [request.params setObject:commentContent forKey:@"critics"];
    
    [request start];
}

+ (void)shareArticleWithArticleID:(NSString *)articleID operateID:(NSString *)personID role:(NSString *)role shareType:(NSString *)type sourceType:(NSString *)sourceType delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagShareArticleRequest;
    request.delegate = _delegate;

    [request.params setObject:articleID forKey:@"wbid"];
    [request.params setObject:personID forKey:@"osid"];
    [request.params setObject:role forKey:@"role"];
    [request.params setObject:type forKey:@"attype"];
    [request.params setObject:sourceType forKey:@"chennl"];
    
    [request start];
}

+ (void)praiseWithOurID:(NSString *)outID operateID:(NSString *)personID praiseType:(NSString *)type delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagPraiseRequest;
    request.delegate = _delegate;
    
    // type 1：公告 2、宝宝秀 3：父母圈 4: 某个评论
    
    [request.params setObject:outID forKey:@"wbid"];
    [request.params setObject:personID forKey:@"osid"];
    [request.params setObject:type forKey:@"attype"];
    
    [request start];
}

+ (void)addFoodRequestWithWeekNumber:(NSString *)weekNumber meal:(NSString *)meal foodImages:(NSMutableArray *)foodImages foodDesc:(NSString *)fooddesc classID:(NSString *)classID schoolID:(NSString *)schoolID operateID:(NSString *)personID delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagAddOneFoodRequest;
    request.delegate = _delegate;
    
    [request.params setObject:weekNumber forKey:@"weeknum"];
    [request.params setObject:meal forKey:@"meal"];
    
    NSString * foodImageString = @"";
    for (NSString * str in foodImages)
    {
        foodImageString = [foodImageString stringByAppendingString:[NSString stringWithFormat:@"%@,",str]];
    }
    foodImageString = [foodImageString substringToIndex:foodImageString.length-1];
    [request.params setObject:foodImageString forKey:@"foodimgs"];
    [request.params setObject:fooddesc forKey:@"fooddescription"];
    [request.params setObject:classID forKey:@"classid"];
    [request.params setObject:schoolID forKey:@"shoolid"];
    [request.params setObject:personID forKey:@"osperion"];
    
    [request start];
}

+ (void)addParentPublishWithSchoolID:(NSString *)schoolID address:(NSString *)address topic:(NSString *)topic content:(NSString *)content topicImage:(NSString *)topicImage type:(NSString *)type delegate:(id)_delegate
{
    PublicRequest * request = [[PublicRequest alloc] init];
    request.vrCodeString = kTagParrentPublishRequest;
    request.delegate = _delegate;
    
    [request.params setObject:schoolID forKey:@"schoolid"];
    [request.params setObject:address forKey:@"address"];
    [request.params setObject:topic forKey:@"topic"];
    [request.params setObject:content forKey:@"topictext"];
    [request.params setObject:topicImage forKey:@"topicimg"];
    [request.params setObject:type forKey:@"topictype"];
    
    [request start];
}

@end
