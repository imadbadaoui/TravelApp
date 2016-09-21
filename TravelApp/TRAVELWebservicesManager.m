//
//  TRAVELWebservicesManager.m
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "TRAVELWebservicesManager.h"
#import "TRAVELWSConfiguration.h"

@implementation TRAVELWebservicesManager

+ (TRAVELWebservicesManager * _Nonnull)sharedInstance
{
    static dispatch_once_t onceToken;
    static TRAVELWebservicesManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[TRAVELWebservicesManager alloc] initWithEndpoint:[TRAVELWSConfiguration sharedInstance].endpointURL];
    });
    return instance;
}

- (instancetype)initWithEndpoint:(NSString*)endpoint
{
    if ([endpoint hasSuffix:@"/"])
        endpoint = [endpoint substringToIndex:endpoint.length - 1];
    
    if (self = [super initWithBaseURL:[NSURL URLWithString:endpoint]])
    {
        self.baseURL = [NSURL URLWithString:endpoint];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json"
                      forHTTPHeaderField:@"Accept"];
        
    }
    return self;
}

- (NSURLSessionDataTask * _Nullable)requestWithMethod:(NSString * _Nonnull)method
                                              andPath:(NSString * _Nonnull)path
                                        andParameters:(id _Nullable)parameters
                                              success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable object))success
                                              failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e))failure
{
    return [self requestWithProgressMethod:method
                                   andPath:path
                             andParameters:parameters
                               andProgress:nil
                                   success:success
                                   failure:failure];
}
- (NSURLSessionDataTask * _Nullable)requestWithProgressMethod:(NSString * _Nonnull)method
                                                      andPath:(NSString * _Nonnull)path
                                                andParameters:(id _Nullable)parameters
                                                  andProgress:(void (^ _Nullable)(NSProgress * _Nonnull progress))progress
                                                      success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable object))success
                                                      failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e))failure
{
    if (![path hasPrefix:@"/"])
        path = [NSString stringWithFormat:@"/%@", path];
    
    NSString * completeURL = [NSString stringWithFormat:@"%@%@", self.baseURL, path];
    
    NSLog(@"NOKI_WS : [%@] %@", method, completeURL);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if ([method isEqualToString:@"GET"])
    {
        return [self GET:completeURL
              parameters:parameters
                progress:progress
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                     success(task, responseObject);
                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                     failure(task, error);
                 }];
    }
    return nil;
}

@end
