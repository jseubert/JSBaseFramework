//
//  CountingLabel.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 7/27/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "CountingLabel.h"

CGFloat const INCREMENT_TIME =  1.0f/20.0f;

@interface CountingLabel ()

@property (nonatomic, strong) NSString* formatString;

@property (nonatomic, assign) CGFloat currentNumber;
@property (nonatomic, assign) CGFloat finalNumber;
@property (nonatomic, assign) CGFloat incrementRatio;

@end

@implementation CountingLabel

- (id)init {
    self = [super init];
    if(self) {
        _formatString = @"%d";
    }
    return self;
}

- (id)initWithFromatText:(NSString *)formatText {
    self = [super init];
    if(self) {
        _formatString = formatText;
    }
    return self;
}

- (void)setFormatString:(NSString *)formatString {
    _formatString = formatString;
    self.text = [NSString stringWithFormat:self.formatString, (int)floorf(self.currentNumber)];
}

- (void)setNumber:(CGFloat)number {
    [self setNumber:number duration:0.5f];
}

- (void)setNumber:(CGFloat)number duration:(CGFloat)duration {
    if(duration > 0) {
        self.incrementRatio = fabs(number - self.currentNumber) / (duration / INCREMENT_TIME);
        
        self.currentNumber = self.finalNumber;
        self.finalNumber = number;
        
        [self updateLabel];
    } else {
        self.finalNumber = number;
        self.currentNumber = self.finalNumber;
        self.text = [NSString stringWithFormat:self.formatString, (int)floorf(self.currentNumber)];
    }
}

- (void)updateLabel {

    if(self.currentNumber != self.finalNumber) {
        self.currentNumber = MAX(0, self.finalNumber > self.currentNumber ? MIN(self.finalNumber, self.currentNumber + self.incrementRatio) : MAX(self.finalNumber , self.currentNumber - self.incrementRatio));
    }
    self.text = [NSString stringWithFormat:self.formatString, (int)floorf(self.currentNumber)];
    
    
    if(self.currentNumber != self.finalNumber) {
        [NSTimer scheduledTimerWithTimeInterval:INCREMENT_TIME
                                         target:self
                                       selector:@selector(updateLabel)
                                       userInfo:nil
                                        repeats:NO];
    }
    
}

@end
