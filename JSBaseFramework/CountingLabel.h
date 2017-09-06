//
//  CountingLabel.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 7/27/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountingLabel : UILabel

- (id)initWithFromatText:(NSString *)formatText;
- (void)setNumber:(CGFloat)number duration:(CGFloat)duration;
- (void)setNumber:(CGFloat)number;
- (void)setFormatString:(NSString *)formatString;

@end
