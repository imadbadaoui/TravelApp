//
//  RLMResults+Array.h
//  NOKI
//
//  Created by Imad on 01/03/2016.
//  Copyright © 2016 sqli. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMResults (Array)

/**
 *  Get an array from realm results
 */
- (NSArray *)toArray;

@end
