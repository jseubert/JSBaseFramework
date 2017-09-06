//
//  UIFonft.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "UIFont+Defaults.h"

@implementation UIFont (Defaults)
+ (UIFont *)defaultFontWithSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)defaultFont {
    return [UIFont systemFontOfSize:14];
}

+ (UIFont *)defaultBoldFont {
    return [UIFont boldSystemFontOfSize:14];
}

+ (UIFont *)defaultBoldFontWithSize:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)defaultSubtitleFont {
    return [UIFont systemFontOfSize:10];
}

+ (UIFont *)defaultBoldSubtitleFont {
    return [UIFont boldSystemFontOfSize:10];
}
@end
