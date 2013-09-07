//
//  ViewController.h
//  SleepLancher
//
//  Created by Sasaki Takuro on 2013/09/06.
//  Copyright (c) 2013年 Takuro SASAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ViewController : UIViewController<UIApplicationDelegate> {
    id _delegate;
}
@property (nonatomic, readonly) id delegate;
- (IBAction)exitApplication:(id)sender;
- (IBAction)suspendIphone:(id)sender;
- (IBAction)sendNotification:(id)sender;
- (IBAction)cancelNotification:(id)sender;

@end
