//
//  AppDelegate.m
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "AppDelegate.h"
#import "RLMObject+JSONModel.h"
#import "NSArray+Change.h"
#import "RLMResults+Array.h"
#import "TRAVELWebservicesManager+Trains.h"
#import "TRAVELWebservicesManager+Buses.h"
#import "TRAVELWebservicesManager+Flights.h"
#import "TRAVELItemModel.h"
#import "TRAVELRItemModel.h"
#import "Reachability.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];

    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable)
    {
        // unavaible connection
    }
    else
    {
        //connection available
        [self fetchMetaData];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)fetchMetaData
{
    
    [[TRAVELWebservicesManager sharedInstance] getTrainsWithSuccess:^(NSArray * _Nonnull items) {
        
        NSArray<TRAVELRTrains*> * trains = [items arrayWithEnumerationUsingBlock:^id _Nonnull(id  _Nonnull object) {
            return [[TRAVELRTrains alloc] initWithJSONModel:(TRAVELItemModel*)object];
        }];
        
        
        
        RLMRealm * realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addOrUpdateObjectsFromArray:trains];
            
        }];
    } andFailure:^(NSError * _Nonnull error) {
         NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
    }];
    
    [[TRAVELWebservicesManager sharedInstance] getBusesWithSuccess:^(NSArray * _Nonnull items) {
        
        NSArray<TRAVELRBuses*> * buses = [items arrayWithEnumerationUsingBlock:^id _Nonnull(id  _Nonnull object) {
            return [[TRAVELRBuses alloc] initWithJSONModel:(TRAVELItemModel*)object];
        }];
        
        
        
        RLMRealm * realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addOrUpdateObjectsFromArray:buses];
            
        }];
    } andFailure:^(NSError * _Nonnull error) {
        NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
    }];
    
    [[TRAVELWebservicesManager sharedInstance] getFlightsWithSuccess:^(NSArray * _Nonnull items) {
        
        NSArray<TRAVELRFlights*> * flights = [items arrayWithEnumerationUsingBlock:^id _Nonnull(id  _Nonnull object) {
            return [[TRAVELRFlights alloc] initWithJSONModel:(TRAVELItemModel*)object];
        }];
        
        
        
        RLMRealm * realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addOrUpdateObjectsFromArray:flights];
            
        }];
    } andFailure:^(NSError * _Nonnull error) {
        NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
    }];
}

@end
