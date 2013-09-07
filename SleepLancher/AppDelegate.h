//
//  AppDelegate.h
//  SleepLancher
//
//  Created by Sasaki Takuro on 2013/09/06.
//  Copyright (c) 2013年 Takuro SASAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    BOOL _isLockDevice;
}

@property (strong, nonatomic) UIWindow *window;
@property BOOL isLockDevice;

@end
