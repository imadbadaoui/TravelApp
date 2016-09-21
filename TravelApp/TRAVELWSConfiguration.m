//
//  TRAVELWSConfiguration.m
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "TRAVELWSConfiguration.h"
static NSString * const K_CONFIGURATION_WS_ENDPOINT = @"WS_ENDPOINT";
static NSString * const K_CONFIGURATION_WS_ITEMS = @"WS_ITEMS";
static NSString * const K_CONFIGURATION = @"TRAVELWSConfiguration";
static NSString * const K_ENVIRONMENT = @"ENVIRONMENT";
static NSString * const K_WS_METHOD = @"WS_METHOD";
static NSString * const K_WS_PATH = @"WS_PATH";


NSString * _Nonnull const WS_GET_FLIGHTS = @"WS_GET_FLIGHTS";
NSString * _Nonnull const WS_GET_TRAINS = @"WS_GET_TRAINS";
NSString * _Nonnull const WS_GET_BUSES = @"WS_GET_BUSES";

@interface TRAVELWSConfiguration()

@property (nonatomic, strong) NSDictionary * configuration;

@end

@implementation TRAVELWSConfiguration


+ (TRAVELWSConfiguration *)sharedInstance
{
    static dispatch_once_t onceToken;
    static TRAVELWSConfiguration * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[TRAVELWSConfiguration alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:K_CONFIGURATION ofType:@"plist"];
        self.configuration = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    return self;
}

- (NSString*)endpointURL
{
    return (NSString*)[self.configuration objectForKey:K_CONFIGURATION_WS_ENDPOINT];
}

- (NSString*)getMethodForIdentifier:(NSString*)identifier
{
    NSDictionary * current = [self currentEnvironmentWSParameters];
    NSDictionary * ws = [current objectForKey:identifier];
    
    return (ws) ? [ws objectForKey:K_WS_METHOD] : nil;
}

- (NSString*)getPathForIdentifier:(NSString*)identifier
{
    NSDictionary * current = [self currentEnvironmentWSParameters];
    NSDictionary * ws = [current objectForKey:identifier];
    
    return (ws) ? [ws objectForKey:K_WS_PATH] : nil;
}

- (NSDictionary*)currentEnvironmentWSParameters
{
    return [self.configuration objectForKey:K_CONFIGURATION_WS_ITEMS];
}

@end
