//
//  TRAVELWSConfiguration.h
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const WS_GET_FLIGHTS;
extern NSString * _Nonnull const WS_GET_TRAINS;
extern NSString * _Nonnull const WS_GET_BUSES;

@interface TRAVELWSConfiguration : NSObject


+ (TRAVELWSConfiguration *)sharedInstance;

/**
 *  Get the default endpoint URL
 */
- (NSString*)endpointURL;

/**
 *  Get the method type (GET, POST ...) of a WS
 */
- (NSString*)getMethodForIdentifier:(NSString*)identifier;

/**
 *  Get the path / URI of a WS
 */
- (NSString*)getPathForIdentifier:(NSString*)identifier;

@end
