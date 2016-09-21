//
//  TRAVELItemModel.m
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "TRAVELItemModel.h"

@implementation TRAVELItemModel



+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id": @"id",
                                                       @"provider_logo" : @"provider_logo",
                                                       @"departure_time" : @"departure_time",
                                                       @"arrival_time" : @"arrival_time",
                                                       @"price_in_euros" : @"price_in_euros",
                                                       @"number_of_stops" : @"number_of_stops"}];
}
@end
