//
//  NSArray+Change.h
//  NOKI
//
//  Created by Imad on 26/02/2016.
//  Copyright © 2016 sqli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Change)

/**
 *  Enumerate through the array and return an array according to the block
 */
- (NSArray * _Nonnull)arrayWithEnumerationUsingBlock:(id _Nonnull (^ _Nonnull) (id _Nonnull object))block;

@end
