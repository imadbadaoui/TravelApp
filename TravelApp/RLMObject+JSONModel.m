//
//  RLMObject+JSONModel.m
//  NOKI
//
//  Created by Imad on 26/02/2016.
//  Copyright © 2016 sqli. All rights reserved.
//

#import <objc/runtime.h>

#import "RLMObject+JSONModel.h"

@implementation RLMObject (JSONModel)

- (instancetype)initWithJSONModel:(id)jsonModel
{
    NSDictionary *keyValueMap = [RLMObject dictionaryFromJSONModel:jsonModel];
    self = [self initWithValue:keyValueMap];
    return self;
}

+ (NSDictionary*)dictionaryFromJSONModel:(id)jsonModel
{
    NSMutableDictionary * datas = [NSMutableDictionary dictionary];
    
    unsigned int count;
    objc_property_t * properties = class_copyPropertyList([jsonModel class], &count);

    for (unsigned int i = 0; i < count; i++)
    {
        objc_property_t prop = properties[i];
        NSString * key = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [jsonModel valueForKey:key];

        if (value)
            [datas setObject:value forKey:key];
    }
    return datas;
}

@end
