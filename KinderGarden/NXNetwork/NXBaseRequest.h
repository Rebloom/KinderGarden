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
#import <Foundation/Foundation.h>

#import "AFNetworking.h"

#import "NSMutableDictionary+AssertNilValue.h"

// 宏定义Restful API的常用请求方法
typedef NS_ENUM(NSInteger, NXRequestMethod)
{
    NXRequestMethodGet = 1,
    NXRequestMethodPost,
    NXRequestMethodPut,
    NXRequestMethodDelete
};

typedef NS_ENUM(NSInteger, NXRequestSerialiazerType)
{
    NXRequestSerialiazerTypeHTTP = 0,
    NXRequestSerialiazerTypeJSON
};

typedef NS_ENUM(NSInteger, NXRequestPriority)
{
    NXRequestPriorityDefault = 0,
    NXRequestPriorityLow,
    NXRequestPriorityHigh
};

typedef void (^AFConstructingBlock) (id<AFMultipartFormData> formData);

@class NXBaseRequest;

typedef void (^NXRequestEndBlock) (__kindof NXBaseRequest *request);

@protocol NXRequestDelegate <NSObject>

@required

- (void)nxRequestFinished:(NXBaseRequest *)request;

@optional
- (void)nxRequestFailed:(NXBaseRequest *)request;
- (void)nxRequestFinishedWithErrorType:(NSInteger)type;
- (void)clearRequest;

@end

@interface NXBaseRequest : NSObject

// tag
@property (nonatomic, assign) NSInteger tag;

// 其他接口主地址
@property (nonatomic, copy) NSString * requestMainUrl;

// 接口版本号跟接口序列号
@property (nonatomic, copy) NSString * vrCodeString;

// 是否需要回调处理错误码,默认不需要
@property (nonatomic, assign) NSInteger handleErrorCode;

// 提交的参数信息
@property (nonatomic, strong) NSMutableDictionary * params;
@property (nonatomic, strong) NSMutableDictionary * domainParams;


@property (nonatomic, strong) NSDictionary * attributeDic;
@property (nonatomic, strong) NSDictionary * domainDic;

@property (nonatomic, assign) BOOL isJsonRequest;

@property (nonatomic, assign) BOOL isHttp;

@property (nonatomic, strong) NSURLSessionTask * requestTask;

// delegate
@property (nonatomic, weak) id <NXRequestDelegate> delegate;

@property (nonatomic, strong, readonly) NSDictionary * responseHeaders;

@property (nonatomic, strong) NSData * responseData;

@property (nonatomic, copy) NSString * responseString;

@property (nonatomic, copy) id responseJSONObject;

@property (nonatomic, assign) NSInteger responseStatusCode;

@property (nonatomic, copy) NXRequestEndBlock successCompletionBlock;

@property (nonatomic, copy) NXRequestEndBlock failureCompletionBlock;

// 请求的优先级，优先级高的请求会从请求队列中优先出列
@property (nonatomic) NXRequestPriority requestPriority;

// block回调

- (void)start;

- (void)startThird;

- (void)stop;

- (void)startRequestWithEndSuccess:(NXRequestEndBlock)success
                        endFailure:(NXRequestEndBlock)failure;

- (void)setRequestWithEndSuccess:(NXRequestEndBlock)success
                      endFailure:(NXRequestEndBlock)failure;

// 防止循环引用
- (void)clearRequestEndBlock;

- (NSString *)requestUrl;

- (NSString *)cdnUrl;

- (NSString *)baseUrl;

// 请求超时时间

- (NSTimeInterval)requestTimeoutInterval;

// 请求参数列表
- (id)requestArgument;

// cache结果，计算cache文件名
- (id)cacheFileNameFilterForRequestArgument:(id)argument;

// 请求方法
- (NXRequestMethod)requestMethod;

// 请求序列化方式
- (NXRequestSerialiazerType)requestSerializerType;

// HTTP报头添加自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary;

// 自定义请求UrlRequest
- (NSURLRequest *)buildCustomUrlRequest;

// 是否使用CDN
- (BOOL)useCDN;

// 检查JSON是否是合法对象
- (id)jsonValidator;

// 检查状态码是否正常
- (BOOL)statusCodeValidator;

// 当POST的内容带有文件等时使用
- (AFConstructingBlock)constructingBodyBlock;

@end
