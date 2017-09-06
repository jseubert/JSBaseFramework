//
//  CircleView.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 7/19/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()

@property (nonatomic, assign) CGFloat circleWidth;

@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation CircleView

- (id)initWithProgressColor:(UIColor *)progressColor circleColor:(UIColor *)circleColor {
    self = [super init];
    if (self) {
        self.circleLayer = [CAShapeLayer layer];
        self.circleLayer.fillColor = [[UIColor clearColor] CGColor];
        self.circleLayer.strokeColor = [circleColor CGColor];
        self.circleLayer.lineCap = @"round";
        self.circleLayer.strokeEnd = 1;
        self.circleLayer.strokeStart = 0.0;
        [self.layer addSublayer:self.circleLayer];
        
        self.backgroundColor = [UIColor whiteColor];
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.fillColor = [[UIColor clearColor] CGColor];
        self.progressLayer.strokeColor = [progressColor CGColor];
        self.progressLayer.lineCap = @"round";
        self.progressLayer.strokeStart = 0.0;
        self.progressLayer.strokeEnd = 0.0;
        [self.layer addSublayer:self.progressLayer];
    }
    return self;
}

- (void)setProgressColor:(UIColor *)progressColor circleColor:(UIColor *)circleColor {
    self.circleLayer.strokeColor = [circleColor CGColor];
    self.progressLayer.strokeColor = [progressColor CGColor];
    [self setNeedsLayout];
}


- (void)setProgress:(CGFloat)newProgress animationTime:(CGFloat)animationTime {
    if(newProgress != _progress) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration = animationTime;
        animation.fromValue = [NSNumber numberWithDouble:_progress];
        animation.toValue = [NSNumber numberWithDouble:newProgress];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        self.progressLayer.strokeEnd = newProgress;
        [self.progressLayer addAnimation:animation forKey:@"animateCircle"];
        
        _progress = newProgress;
    }
    
}

- (void)setProgress:(CGFloat)newProgress {
    if(newProgress != _progress) {
        self.progressLayer.strokeEnd = newProgress;
        _progress = newProgress;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint arcCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat lineWidth = self.bounds.size.width/10;
    CGFloat radius = CGRectGetMidX(self.bounds) - lineWidth/2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                       radius:radius
                                                   startAngle:-M_PI_2
                                                     endAngle:-M_PI_2 + (M_PI*2)
                                                    clockwise:YES];
    self.circleLayer.frame = self.bounds;
    self.circleLayer.lineWidth = lineWidth*(2.0f/4.0f);
    self.circleLayer.path = path.CGPath;
    
    self.progressLayer.frame = self.bounds;
    self.progressLayer.lineWidth = lineWidth;
    self.progressLayer.path = path.CGPath;

}

@end
