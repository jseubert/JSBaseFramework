//
//  UIViewController+ApplicationStates.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/18/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ApplicationStates)

- (void)listenToApplicationStates;
- (void)stopListeningToApplicationStates;
- (void)applicationWillResignActive:(NSNotification *)notification;
- (void)applicationDidEnterBackground:(NSNotification *)notification;
- (void)applicationWillEnterForeground:(NSNotification *)notification;
- (void)applicationDidBecomeActive:(NSNotification *)notification;
- (void)applicationWillTerminate:(NSNotification *)notification;

@end
