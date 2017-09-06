//
//  UIString.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font andWidth:(CGFloat)width;
@end
