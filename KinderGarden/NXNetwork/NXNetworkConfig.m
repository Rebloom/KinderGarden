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

#import "NXNetworkConfig.h"

#import "TKAlertCenter.h"

@implementation NXNetworkConfig
{
    NSMutableArray *_urlFilters;
    NSMutableArray *_cacheDirPathFilters;
}

+ (NXNetworkConfig *)sharedInstance
{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

+ (NSString *)getUserAgent
{
    NSString *userAgent;

    return userAgent;
}

+ (BOOL)checkJson:(id)json
{
    if ([json isKindOfClass:[NSDictionary class]])
    {
        NSDictionary * dict = json;
        BOOL result = YES;
        
        for (NSString * key in dict.allKeys)
        {
            id value = dict[key];
            if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]])
            {
                result = [self checkJson:value];
                if (!result)
                {
                    break;
                }
            }
            else
            {
                if ([value isKindOfClass:[NSNull class]])
                {
                    result = NO;
                    break;
                }
            }
        }
        return result;
    }
    else if ([json isKindOfClass:[NSArray class]])
    {
        NSArray * array = json;
        for (id item in array)
        {
            BOOL result = [self checkJson:item];
            if (!result) {
                return NO;
            }
        }
    }
    return YES;
}



+ (NSString *)buildJSONStringWithString:(NSString *)vrCode params:(NSDictionary *)params domainParams:(NSDictionary *)domainParams base64:(BOOL)base64Encoding
{
    if ([vrCode componentsSeparatedByString:@"."].count != 2)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"请使用\".\"分割接口版本号与接口编号"];
    }
    NSMutableDictionary * mParams = [NSMutableDictionary dictionaryWithDictionary:params];
    
    NSString * timestamp = [NSString stringWithFormat:@"%ld000",(long)[[NSDate date] timeIntervalSince1970],nil];
    [mParams setObject:timestamp forKey:@"timestamp"];
    [mParams setObject:[[NXNetworkConfig sharedInstance] getSignStringWithTimeStamp:timestamp] forKey:@"sign"];
    
    NSMutableDictionary * dataDic = [NSMutableDictionary dictionary];
    [dataDic setObject:mParams forKey:@"attrs"];
    
    if (domainParams)
    {
        [dataDic setObject:domainParams forKey:@"domains"];
    }

    NSMutableDictionary * jsonDic = [NSMutableDictionary dictionary];
    [jsonDic setObject:dataDic forKey:@"d"];
    [jsonDic setObject:[[vrCode componentsSeparatedByString:@"."] objectAtIndex:0] forKey:@"v"];
    [jsonDic setObject:[[vrCode componentsSeparatedByString:@"."] objectAtIndex:1] forKey:@"r"];
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic
                                                       options:kNilOptions
                                                         error:&error];
    
    
    NSString * jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    return base64Encoding?jsonString.base64EncodedString:jsonString;
}

- (NSString *)getSignStringWithTimeStamp:(NSString *)timeStamp
{
    NSString * sign = @"";
    return sign;
}

- (NSString *)getDesKEY
{
    NSString * desKEY = nil;
    return desKEY;
}

- (id)init
{
    if (self == [super init])
    {
        _urlFilters = [NSMutableArray array];
        _cacheDirPathFilters = [NSMutableArray array];
    }
    
    return self;
}

- (void)addUrlFilters:(id<NXUrlFilterProtocal>)filter
{
    [_urlFilters addObject:filter];
}

- (void)addCacheDirPathFilters:(id<NXCacheDirPathFilterProtocal>)filter
{
    [_cacheDirPathFilters addObject:filter];
}

- (NSArray *)urlFilters
{
    return [_urlFilters copy];
}

- (NSArray *)cacheDirPathFilters
{
    return [_cacheDirPathFilters copy];
}

@end
