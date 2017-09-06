//
//  UILabel.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "UILabel+Size.h"
#import "NSString+Size.h"

@implementation UILabel (Size)
- (CGSize)sizeOfLabelWithWithWidth:(CGFloat)width {
    return [self.text sizeWithFont:self.font andWidth:width];
}
@end
