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

- (IBAction)sendNotification:(id)sender {
    NSLog(@"sendNotification");
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app sendNotification:@"ロック" alertKey:@"lock"];
    NSLog(@"sendNotification End");
}

- (IBAction)cancelNotification:(id)sender {
    UIApplication* app = [UIApplication sharedApplication];
    [app cancelAllLocalNotifications];
}


- (IBAction)suspendIphone:(id)sender {
    [[UIApplication sharedApplication] terminateWithSuccess];
}

- (IBAction)exitApplication:(id)sender {
    NSLog(@"exitApplication");
    exit(0);
}

@end
