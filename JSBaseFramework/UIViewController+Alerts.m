//
//  ViewController+Alerts.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/22/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "UIViewController+Alerts.h"

@implementation UIViewController (Alerts)

- (void)showErrorAlertView:(NSError *)fault {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:fault.localizedDescription preferredStyle:UIAlertControllerStyleAlert];

    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", @"") style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
