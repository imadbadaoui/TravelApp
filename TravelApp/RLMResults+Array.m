//
//  RLMResults+Array.m
//  NOKI
//
//  Created by Imad on 01/03/2016.
//  Copyright © 2016 sqli. All rights reserved.
//

#import "RLMResults+Array.h"

@implementation RLMResults (Array)

- (NSArray *)toArray
{
    NSMutableArray *array = [NSMutableArray array];

    for (RLMObject * object in self)
        [array addObject:object];

    return array;
}

@end
