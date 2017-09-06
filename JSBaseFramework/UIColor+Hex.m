//
//  UIColor-HexExpansion.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 5/29/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(float)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    return [self colorWithRGBHex:hex alpha:1.0];
}

+ (UIColor *)colorWithRedAmount:(CGFloat)r
                    greenAmount:(CGFloat)g
                     blueAmount:(CGFloat)b {
    
    return [UIColor colorWithRedAmount:r
                           greenAmount:g
                            blueAmount:b
                                 alpha:1.0];
}

+ (UIColor *)colorWithRedAmount:(CGFloat)r
                    greenAmount:(CGFloat)g
                     blueAmount:(CGFloat)b
                          alpha:(CGFloat)alpha {

    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

@end
