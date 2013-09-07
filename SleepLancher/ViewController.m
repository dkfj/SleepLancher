//
//  ViewController.m
//  SleepLancher
//
//  Created by Sasaki Takuro on 2013/09/06.
//  Copyright (c) 2013年 Takuro SASAKI. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc
{
    [_delegate release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
    //if( [[UIApplication sharedApplication] respondsToSelector:@selector(terminate)] )
		[[UIApplication sharedApplication] performSelector:@selector(terminate)];
//    exit(0);
}
*/
- (IBAction)sendNotification:(id)sender {
    NSLog(@"sendNotification");
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"home" forKey:@"Key"];
    
    notification.fireDate = [[NSDate date] addTimeInterval:1]; // 1秒後に通知
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"ホーム";
    notification.alertAction = @"Open";
    notification.userInfo = userInfo;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // 通知を登録する
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    [notification release];
    
    notification = [[UILocalNotification alloc] init];
    userInfo = [NSDictionary dictionaryWithObject:@"lock" forKey:@"Key"];
    
    notification.fireDate = [[NSDate date] addTimeInterval:1]; // 1秒後に通知
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"ロック";
    notification.alertAction = @"Open";
    notification.userInfo = userInfo;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // 通知を登録する
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    [notification release];
    NSLog(@"sendNotification End");
}

- (IBAction)cancelNotification:(id)sender {
    UIApplication* app = [UIApplication sharedApplication];
    [app cancelAllLocalNotifications];
    /*
    for (UILocalNotification* notification in notifications) {
        // １つずつ再登録
        [app scheduleLocalNotification:notification];
    }
     */
}


- (IBAction)suspendIphone:(id)sender {
    [[UIApplication sharedApplication] terminateWithSuccess];
}

- (IBAction)exitApplication:(id)sender {
    NSLog(@"exitApplication");
    [[UIApplication sharedApplication] terminateWithSuccess];
/*
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *delegate = [(AppDelegate *)[UIApplication sharedApplication] delegate];
    //[self dealloc];
    [delegate applicationWillTerminate:app];
 */
}

@end
