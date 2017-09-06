//
//  UIView+Size.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "UIView+Size.h"

@implementation UIView (Size)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (CGFloat)height {
    return self.bounds.size.height;
}

- (CGFloat)end {
    return self.bounds.size.width + self.frame.origin.x;
}

- (CGFloat)bottom {
    return self.bounds.size.height + self.frame.origin.y;
}

@end
