//
//  TRAVELWebservicesManager.h
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface TRAVELWebservicesManager : AFHTTPSessionManager
@property (nonatomic, strong) NSURL *baseURL;

+ (TRAVELWebservicesManager * _Nonnull)sharedInstance;

- (NSURLSessionDataTask * _Nullable)requestWithMethod:(NSString * _Nonnull)method
                                              andPath:(NSString * _Nonnull)path
                                        andParameters:(id _Nullable)parameters
                                              success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable object))success
                                              failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e))failure;
- (NSURLSessionDataTask * _Nullable)requestWithProgressMethod:(NSString * _Nonnull)method
                                                      andPath:(NSString * _Nonnull)path
                                                andParameters:(id _Nullable)parameters
                                                  andProgress:(void (^ _Nullable)(NSProgress * _Nonnull progress))progress
                                                      success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable object))success
                                                      failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e))failure;

@end
