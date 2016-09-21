//
//  RLMObject+JSONModel.h
//  NOKI
//
//  Created by Imad on 26/02/2016.
//  Copyright © 2016 sqli. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Realm/Realm.h>
#import <JSONModel.h>

@interface RLMObject (JSONModel)

/**
 *  To create a realm model from a json model
 */
- (instancetype)initWithJSONModel:(id)jsonModel;

@end
