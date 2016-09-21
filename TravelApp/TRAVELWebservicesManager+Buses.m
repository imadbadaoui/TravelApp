//
//  TRAVELWebservicesManager+Buses.m
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "TRAVELWebservicesManager+Buses.h"

@implementation TRAVELWebservicesManager (Buses)

- (NSURLSessionDataTask * _Nullable)getBusesWithSuccess:(void (^ _Nonnull)(NSArray * _Nonnull items))success
                                               andFailure:(void (^ _Nonnull)(NSError * _Nonnull error))failure
{
    NSString * method = [[TRAVELWSConfiguration sharedInstance] getMethodForIdentifier:WS_GET_BUSES];
    NSString * path = [[TRAVELWSConfiguration sharedInstance] getPathForIdentifier:WS_GET_BUSES];
    
    
    return [self requestWithMethod:method
                           andPath:path
                     andParameters:nil
                           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable object)
            {
                NSError * error;
                
                NSArray * models = [TRAVELItemModel arrayOfModelsFromData:object error:&error];
                // TRAVELItemModel * news = [[TRAVELItemModel alloc] initWithData:object error:&error];
                
                if (error)
                    failure(error);
                else
                {
                    dispatch_group_t group = dispatch_group_create();
                    
                    [models enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
                     {
                         TRAVELItemModel * n = (TRAVELItemModel*)obj;
                         
                         
                         if (n.provider_logo)
                         {
                             dispatch_group_enter(group);
                             NSString * imageUrl = [n.provider_logo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"] ;
                             //  NSString * imageUrl = [NSString stringWithFormat:@"%@%@", [NOKIWSConfiguration sharedInstance].endpointURL, n.image.uri];
                             NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]]];
                             
                             NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithRequest:urlRequest completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                 if (error == nil) {
                                     UIImage *downloadedImage = [UIImage imageWithData:
                                                                 [NSData dataWithContentsOfURL:location]];
                                     // Create path.
                                     NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                                     NSString * filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[n.provider_logo lastPathComponent]];
                                     
                                     // Save image.
                                     [UIImagePNGRepresentation(downloadedImage) writeToFile:filePath atomically:YES];
                                     dispatch_group_leave(group);
                                 }
                                 else {
                                     dispatch_group_leave(group);
                                     NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
                                 }
                                 // 3
                                 
                                 
                             }];
                             [downloadPhotoTask resume];
                             //                            [[AFImageDownloader defaultInstance] downloadImageForURLRequest:urlRequest success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject)
                             //                            {
                             //                                // Create path.
                             //                                NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                             //                                NSString * filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:n.image.imageId];
                             //
                             //                                // Save image.
                             //                                [UIImagePNGRepresentation(responseObject) writeToFile:filePath atomically:YES];
                             //                                dispatch_group_leave(group);
                             //
                             //                            } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error)
                             //                            {
                             //                                dispatch_group_leave(group);
                             //                                NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
                             //
                             //                            }];
                             //                        }
                             //                        if (n.imageThumb) {
                             //                            dispatch_group_enter(group);
                             //                            NSString * imageUrl = n.imageThumb;
                             //                            NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]]];
                             //
                             //                            NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithRequest:urlRequest completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                             //                                if (error == nil) {
                             //                                    UIImage *downloadedImage = [UIImage imageWithData:
                             //                                                                [NSData dataWithContentsOfURL:location]];
                             //                                    // Create path.
                             //                                    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                             //                                    NSString * filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:n.imageThumb];
                             //
                             //                                    // Save image.
                             //                                    [UIImagePNGRepresentation(downloadedImage) writeToFile:filePath atomically:YES];
                             //                                    dispatch_group_leave(group);
                             //                                }
                             //                                else {
                             //                                    dispatch_group_leave(group);
                             //                                    NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
                             //                                }
                             //                                // 3
                             //
                             //
                             //                            }];
                             //                            [downloadPhotoTask resume];
                             
                             
                             //                            [[AFImageDownloader defaultInstance] downloadImageForURLRequest:urlRequest success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject)
                             //                             {
                             //                                 // Create path.
                             //                                 NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                             //                                 NSString * filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[n.imageThumb lastPathComponent]];
                             //
                             //                                 // Save image.
                             //                                 [UIImagePNGRepresentation(responseObject) writeToFile:filePath atomically:YES];
                             //                                 dispatch_group_leave(group);
                             //
                             //                             } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error)
                             //                             {
                             //                                 dispatch_group_leave(group);
                             //                                 NSLog(@"NOKI_ERROR : %@", [error localizedDescription]);
                             //
                             //                             }];
                         }
                         
                     }];
                    
                    dispatch_group_notify(group, dispatch_get_main_queue(), ^ {
                        success(models);
                    });
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e)
            {
                failure(e);
            }];
}
@end
