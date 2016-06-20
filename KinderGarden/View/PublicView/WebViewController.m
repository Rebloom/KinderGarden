//
//  WebViewController.m
//  XDCY
//
//  Created by 孤星之殇 on 15/8/26.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize detailView;
@synthesize requestUrl;
@synthesize pageType;
@synthesize filePath;
@synthesize title;
@synthesize newsId;
@synthesize htmlStr;

- (void)viewDidLoad {
    [super viewDidLoad];

    [headerView backButton];
    [headerView loadComponentsWithTitle:self.title withTitleColor:KFontColorA];
    
    if (!detailView)
    {
        detailView = [[UIWebView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), screenWidth, screenHeight-headerView.frame.size.height)];
    }
    detailView.delegate = self;
    detailView.dataDetectorTypes = UIDataDetectorTypeNone;//关闭自动数字链接
//    detailView.backgroundColor = kBackgroundColor;
    [self.view addSubview:detailView];
    
    if (pageType == WebViewTypeURL)
    {
        htmlStr = [htmlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.htmlStr]];
        [detailView loadRequest:request];
    }
    else if (pageType == WebViewTypeLocalHtml)
    {
        //encoding:NSUTF8StringEncoding error:nil 这一段一定要加，不然中文字会乱码
        NSString * htmlstring=[[NSString alloc] initWithContentsOfFile:self.filePath  encoding:NSUTF8StringEncoding error:nil];
        
        [detailView loadHTMLString:htmlstring baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    }
    else if (pageType == WebViewTypeHtml)
    {
        [detailView loadHTMLString:self.htmlStr baseURL:nil];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *targetPage = [request.URL absoluteString];
    
    //tunnel   xdcyd
    if([targetPage rangeOfString:@"tunnel"].location !=NSNotFound)//_roaldSearchText
    {
        if ([targetPage componentsSeparatedByString:@"title="].count > 1)
        {
            NSString * msg = [[[[targetPage componentsSeparatedByString:@"="] lastObject] description]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            detailView.hidden = YES;
        }
    }
    else if([targetPage rangeOfString:@"xdcyd"].location !=NSNotFound)
    {
        if ([targetPage componentsSeparatedByString:@"title="].count > 1)
        {
            NSString * msg = [[[[targetPage componentsSeparatedByString:@"="] lastObject] description]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];            detailView.hidden = YES;
        }
    }
    else if([targetPage rangeOfString:@"sdxd"].location !=NSNotFound)
    {
        if ([targetPage componentsSeparatedByString:@"title="].count > 1)
        {
            NSString * msg = [[[[targetPage componentsSeparatedByString:@"="] lastObject] description]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            detailView.hidden = YES;
        }
    }

    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //    for(BasicViewController * bvc in self.navigationController.viewControllers)
    //    {
    //        if ([bvc isKindOfClass:[EarnMoneyViewController class]])
    //        {
    //            [self.navigationController popToViewController:bvc animated:YES];
    //        }
    //    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    NSLog(@"开始加载");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    NSLog(@"加载成功，取消加载");
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    NSLog(@"加载失败，取消加载");
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
