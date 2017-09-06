//
//  UIString.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font andWidth:(CGFloat)width {
    CGRect frame = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
    return CGSizeMake(ceilf(frame.size.width), ceilf(frame.size.height));
}
@end
