//
//  NSArray+Change.m
//  NOKI
//
//  Created by Imad on 26/02/2016.
//  Copyright © 2016 sqli. All rights reserved.
//

#import "NSArray+Change.h"

@implementation NSArray (Change)

- (NSArray * _Nonnull)arrayWithEnumerationUsingBlock:(id _Nonnull (^ _Nonnull) (id _Nonnull object))block
{
    NSMutableArray * arr = [NSMutableArray array];
    
    for (id obj in self)
    {
        id val = block(obj);
        if (val) [arr addObject:val];
    }
    
    return arr;
}

@end
