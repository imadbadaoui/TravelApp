//
//  TRAVELWebservicesManager+Trains.h
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "TRAVELWebservicesManager.h"


@interface TRAVELWebservicesManager (Trains)

- (NSURLSessionDataTask * _Nullable)getTrainsWithSuccess:(void (^ _Nonnull)(NSArray * _Nonnull items))success
                                            andFailure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;

@end
