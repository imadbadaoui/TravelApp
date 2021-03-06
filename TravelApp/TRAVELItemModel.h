//
//  TRAVELItemModel.h
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//
#import <Foundation/Foundation.h>
@protocol TRAVELItemModel
@end
@interface TRAVELItemModel : JSONModel

@property (nonatomic, strong) NSString * provider_logo;
@property (nonatomic, strong) NSString * departure_time;
@property (nonatomic, strong) NSString * arrival_time;
@property (nonatomic, strong) NSString * price_in_euros;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger number_of_stops;
@end
