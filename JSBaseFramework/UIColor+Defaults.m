//
//  UIColort+Defaults.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "UIColor+Defaults.h"
#import <JSBaseFramework/UIColor+Hex.h>

@implementation UIColor (Defaults)
+ (UIColor*)collectionViewBackgroundColor {
    return [UIColor colorWithRedAmount:239 greenAmount:239 blueAmount:244];
}
+ (UIColor*)subtitleTextColor {
    return [UIColor colorWithRGBHex:0x999ea3];
}
@end
