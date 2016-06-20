//
//  WebViewController.h
//  XDCY
//
//  Created by 孤星之殇 on 15/8/26.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

typedef enum WebViewType
{
    WebViewTypeURL = 1,
    WebViewTypeLocalHtml,
    WebViewTypeHtml
}_WebViewType;

#import "BasicViewController.h"

@interface WebViewController : BasicViewController<UIWebViewDelegate,UIAlertViewDelegate>
{
    UIActivityIndicatorView *progressInd;
}
@property (nonatomic, strong) UIWebView * detailView;
@property (nonatomic, strong) NSURL * requestUrl;
@property (nonatomic, assign) NSInteger pageType;
@property (nonatomic, copy)  NSString *filePath;
@property (nonatomic, copy)  NSString * title;
@property (nonatomic, copy)  NSString * newsId;
@property (nonatomic, copy)  NSString * htmlStr;



@end
