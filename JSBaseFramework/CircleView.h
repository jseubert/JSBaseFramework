//
//  CircleView.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 7/19/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
@property (nonatomic, assign) CGFloat progress;

- (id)initWithProgressColor:(UIColor *)progressColor circleColor:(UIColor *)circleColor;

- (void)setProgressColor:(UIColor *)progressColor circleColor:(UIColor *)circleColor;
- (void)setProgress:(CGFloat)newProgress animationTime:(CGFloat)animationTime;
- (void)setProgress:(CGFloat)newProgress;
@end
