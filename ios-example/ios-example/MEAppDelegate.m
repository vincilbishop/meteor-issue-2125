//
//  MEAppDelegate.m
//  ios-example
//
//  Created by Vincil Bishop on 5/7/14.
//  Copyright (c) 2014 Meteor. All rights reserved.
//

#import "MEAppDelegate.h"



@implementation MEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MYMeteorClient setMeteorURLString:@"http://localhost:3000/websocket"];
 
    [RACObserve([MYMeteorClient sharedClient], websocketReady) subscribeNext:^(NSNumber *websocketReady) {
        NSLog(@"RAC: [MYMeteorClient sharedClient].websocketReady: %@", websocketReady);
    }];
    
    [RACObserve([MYMeteorClient sharedClient], connected) subscribeNext:^(NSNumber *connected) {
        NSLog(@"RAC: [MYMeteorClient sharedClient].connected: %@", connected);
    }];
    
    NSLog(@"[MYMeteorClient sharedClient].websocketReady: %i",[MYMeteorClient sharedClient].websocketReady);
    NSLog(@"[MYMeteorClient sharedClient].connected: %i",[MYMeteorClient sharedClient].connected);
    
    [[MYMeteorClient sharedClient] logonWithUsername:@"test@test.com" password:@"supersecret" responseCallback:^(NSDictionary *response, NSError *error) {
        
        NSLog(@"response: %@",response);
        NSLog(@"error: %@",error);
        
    }];
    
    NSLog(@"websocketReady: %i",[MYMeteorClient sharedClient].websocketReady);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
