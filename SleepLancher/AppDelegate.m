//
//  AppDelegate.m
//  SleepLancher
//
//  Created by Sasaki Takuro on 2013/09/06.
//  Copyright (c) 2013年 Takuro SASAKI. All rights reserved.
//

#import "AppDelegate.h"
#include <dlfcn.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] terminateWithSuccess];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate");
    //[self cancelNotification];
    //[self sendNotification:@"ロック" alertKey:@"lock"];

    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [UIViewController new];
    [self.window makeKeyAndVisible];
    
	// Get a reference to the private framework where the screen locking function resides
	char *framework = "/System/Library/PrivateFrameworks/GraphicsServices.framework/GraphicsServices";
	void *handle	= dlopen(framework, RTLD_NOW);
	if (handle)
	{
		// Get the symbol address for the screen locking function
		void (*GSEventLockDevice)() = dlsym(handle, "GSEventLockDevice");
		if (GSEventLockDevice)
		{
			// Lock the screen
			GSEventLockDevice();
		}
		dlclose(handle);
	}
	// Once the screen is locked, we quit because otherwise unlocking
	// the screen would bring us back to the app, which would lock the screen...
	exit(0);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"didReceiveLocalNotification");
    if (notification) {
        NSLog(@"exist notification");
        NSString *value = [notification.userInfo objectForKey:@"Key"];
        if ([value isEqualToString:@"lock"]) {
            //_isLockDevice = YES;
        }
        NSLog(@"key=%@",value);
    }
    NSLog(@"didReceiveLocalNotification End");
    [[UIApplication sharedApplication] terminateWithSuccess];
}

- (void)sendNotification:(NSString *)alertBody alertKey:(NSString *)alertKey {
    NSLog(@"sendNotification");
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:alertKey forKey:@"Key"];
    
    notification.fireDate = [[NSDate date] addTimeInterval:1]; // n秒後に通知
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = alertBody;
    notification.alertAction = @"Open";
    notification.userInfo = userInfo;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // 通知を登録する
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    [notification release];
}

- (void)cancelNotification {
    UIApplication* app = [UIApplication sharedApplication];
    [app cancelAllLocalNotifications];
}


@end
