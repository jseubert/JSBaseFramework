//
//  UIColor-HexExpansion.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 5/29/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(float)alpha;
+ (UIColor *)colorWithRedAmount:(CGFloat)r
                    greenAmount:(CGFloat)g
                     blueAmount:(CGFloat)b
                          alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRedAmount:(CGFloat)r
                    greenAmount:(CGFloat)g
                     blueAmount:(CGFloat)b;

@end
