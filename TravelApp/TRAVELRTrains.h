//
//  TRAVELRTrains.h
//  TravelApp
//
//  Created by Imad Badaoui on 21/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import <Realm/Realm.h>

@interface TRAVELRTrains : RLMObject

@property (nonatomic, strong) NSString * provider_logo;
@property (nonatomic, strong) NSString * departure_time;
@property (nonatomic, strong) NSString * arrival_time;
@property (nonatomic, strong) NSString * price_in_euros;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger number_of_stops;
@end
