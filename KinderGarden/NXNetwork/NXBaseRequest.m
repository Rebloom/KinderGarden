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

#import "NXBaseRequest.h"

#import "NXRequestManager.h"

@implementation NXBaseRequest

- (id)init
{
    if (self == [super init])
    {
        self.params = [NSMutableDictionary dictionary];
        self.domainParams = [NSMutableDictionary dictionary];
        self.attributeDic = [NSDictionary dictionary];
        self.domainDic = [NSDictionary dictionary];
    }
    return self;
}

- (void)requestCompleteFilter {
}

- (void)requestFailedFilter {
}

- (void)clearRequestEndBlock
{
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (NSString *)requestUrl {
    return @"";
}

- (NSString *)cdnUrl {
    return @"";
}

- (NSString *)baseUrl {
    return @"";
}

- (NSTimeInterval)requestTimeoutInterval {
    return 10;
}

- (id)requestArgument {
    return nil;
}

- (id)cacheFileNameFilterForRequestArgument:(id)argument {
    return argument;
}

- (NXRequestMethod)requestMethod {
    return NXRequestMethodPost;
}

- (NXRequestSerialiazerType)requestSerializerType {
    return NXRequestSerialiazerTypeHTTP;
}

- (NSArray *)requestAuthorizationHeaderFieldArray {
    return nil;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return nil;
}

- (NSURLRequest *)buildCustomUrlRequest {
    return nil;
}

- (BOOL)useCDN {
    return NO;
}

- (id)jsonValidator {
    return nil;
}

- (BOOL)statusCodeValidator {
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    } else {
        return NO;
    }
}

- (AFConstructingBlock)constructingBodyBlock {
    return nil;
}

- (NSString *)resumableDownloadPath {
    return nil;
}

/// append self to request queue
- (void)start {
    [[NXRequestManager shareManager] addNXPostRequest:self];
}

/// remove self from request queue
- (void)stop {
    self.delegate = nil;
    [[NXRequestManager shareManager] cancelRequest:self];
}

- (void)startRequestWithEndSuccess:(NXRequestEndBlock)success endFailure:(NXRequestEndBlock)failure
{
    [self setRequestWithEndSuccess:success endFailure:failure];
    [self start];
}

- (void)setRequestWithEndSuccess:(NXRequestEndBlock)success endFailure:(NXRequestEndBlock)failure
{
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

@end
