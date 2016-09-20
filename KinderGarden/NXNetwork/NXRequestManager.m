//  Copyright (c) 2012-2014 YTKNetwork https://github.com/yuantiku
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "NXRequestManager.h"

#import "NXNetworkConfig.h"

#define NEW_WEBSERVER_URL_STR [NSString stringWithFormat:@"%@/zntServices.action",WEBSERVER_URL_STR,nil]

static NSString * serverErrorString = @"服务器返回数据异常";

static NSString * serverOutTime     = @"请求超时,请稍后重试";

@implementation NXRequestManager
{
    NSMutableDictionary *_requestsRecord;
    
    NXNetworkConfig *_config;
}

+ (NXRequestManager *)shareManager
{
    static id sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}


- (id)init
{
    if (self = [super init])
    {
        _requestsRecord = [NSMutableDictionary dictionary];
        _sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

- (NSString *)buildRequestUrl:(NXBaseRequest *)request {
    NSString *detailUrl = [request requestUrl];
    if ([detailUrl hasPrefix:@"http"]) {
        return detailUrl;
    }
    // filter url
    NSArray *filters = [_config urlFilters];
    for (id<NXUrlFilterProtocal> f in filters) {
        detailUrl = [f filterUrl:detailUrl withRequest:request];
    }
    
    NSString *baseUrl;
    if ([request useCDN]) {
        if ([request cdnUrl].length > 0) {
            baseUrl = [request cdnUrl];
        } else {
            baseUrl = [_config cdnUrl];
        }
    } else {
        if ([request baseUrl].length > 0) {
            baseUrl = [request baseUrl];
        } else {
            baseUrl = [_config baseUrl];
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
}

+ (NSString *)urlParametersStringFromParameters:(NSDictionary *)parameters {
    NSMutableString *urlParametersString = [[NSMutableString alloc] initWithString:@""];
    if (parameters && parameters.count > 0) {
        for (NSString *key in parameters) {
            NSString *value = parameters[key];
            value = [NSString stringWithFormat:@"%@",value];
            value = [self urlEncode:value];
            [urlParametersString appendFormat:@"&%@=%@", key, value];
        }
    }
    return urlParametersString;
}

+ (NSString*)urlEncode:(NSString*)str
{
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)str, CFSTR("."), CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8);
    return result;
}

- (void)addNXPostRequest:(NXBaseRequest *)request
{
    NSString * mainUrlString = @"http://123.206.43.102:8080/support/";
    
    mainUrlString = [mainUrlString stringByAppendingString:request.vrCodeString];

    NSString * bodyString = @"";
    for (NSString * key in request.params)
    {
        if ([request.params.allKeys indexOfObject:key] == 0)
        {
            bodyString = [bodyString stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,[request.params objectForKey:key]]];
        }
        else
        {
            bodyString = [bodyString stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",key,[request.params objectForKey:key]]];
        }
    }
    mainUrlString = [mainUrlString stringByAppendingString:bodyString];
    
    mainUrlString = [mainUrlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    // 基于NSMutableUrlRequest
    NSMutableURLRequest * mRequest = [[NSMutableURLRequest alloc] init];
    // 填写主地址，从子类带过来
    [mRequest setURL:[NSURL URLWithString:mainUrlString]];
    // 设置请求方式
    [mRequest setHTTPMethod:@"GET"];
    // 设置报头格式
    [mRequest setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    // 设定Manager
    self.sessionManager.operationQueue.maxConcurrentOperationCount = 1;
    self.sessionManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain" ,nil];
    self.sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    // 判断提交的请求格式
    if (request.isJsonRequest)
    {
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    else
    {
        self.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    self.sessionManager.requestSerializer.timeoutInterval = request.requestTimeoutInterval;
    
    // 判断是否是http的请求
    if (request.isHttp)
    {
        [mainUrlString stringByReplacingOccurrencesOfString:@"https" withString:@"http"];
    }
    
    __block NXBaseRequest * blockRequest = request;
    NSURLSessionTask * task = [[NSURLSessionTask alloc] init];
    request.requestTask = task;
    task = [self.sessionManager dataTaskWithRequest:mRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        //
        blockRequest.responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        blockRequest.responseData = responseObject;
        blockRequest.responseStatusCode = error?error.code:200;
        [self handleRequestResult:blockRequest];
    }];
    [task resume];
}

- (void)cancelRequest:(NXBaseRequest *)request {

    [request clearRequestEndBlock];
}

- (void)cancelAllRequests {
    NSDictionary *copyRecord = [_requestsRecord copy];
    for (NSString *key in copyRecord) {
        NXBaseRequest *request = copyRecord[key];
        [request stop];
    }
}

- (BOOL)checkResult:(NXBaseRequest *)request {
    BOOL result = [request statusCodeValidator];
    if (!result) {
        return result;
    }
    return [NXNetworkConfig checkJson:request.responseJSONObject];
}

- (void)handleRequestResult:(NXBaseRequest *)request
{
    if (request)
    {
        // 如果网络层请求合法
        if ([self checkResult:request])
        {
            // 如果业务逻辑层请求合法
            NSDictionary * back = [request.responseString jsonValueDecoded];
            NSLog(@"返回的数据是 %@",back);
            if ([back objectForKey:@"success"])
            {
                if ([[back objectForKey:@"success"] integerValue] == 0)
                {
                    if (request.delegate && [request.delegate respondsToSelector:@selector(nxRequestFailed:)]) {
                        [request.delegate nxRequestFailed:request];
                    }
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[TKAlertCenter defaultCenter] postAlertWithMessage:[[back objectForKey:@"msg"] description].length?[back objectForKey:@"msg"]:serverErrorString];
                    });

                }
                else
                {
                    // 正常请求拿到数据放回request准备好的容器
                    request.attributeDic = [back objectForKey:@"obj"];
                    if (request.attributeDic == nil)
                    {
                        request.attributeDic = back;
                    }
                    request.domainDic = [[back objectForKey:@"d"] objectForKey:@"domains"];
                    if (request.delegate && [request.delegate respondsToSelector:@selector(nxRequestFinished:)]) {
                        [request.delegate nxRequestFinished:request];
                    }
                    if (request.successCompletionBlock) {
                        request.successCompletionBlock(request);
                    }
                    
                }
            }
            // 请求超时返回200的情况
            else
            {
                [[TKAlertCenter defaultCenter] postAlertWithMessage:serverOutTime];
            }
        }
        else
        {
            if (request.delegate != nil && [request.delegate respondsToSelector:@selector(nxRequestFailed:)]) {
                [request.delegate nxRequestFailed:request];
            }
            if (request.failureCompletionBlock) {
                request.failureCompletionBlock(request);
            }
        }
    }
    [request clearRequestEndBlock];
}

@end
