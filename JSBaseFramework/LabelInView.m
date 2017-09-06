//
//  LabelInView.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/23/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "LabelInView.h"

@implementation LabelInView

- (id)init {
    self = [super init];
    if(self) {
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.numberOfLines = 0;
        [self addSubview:self.textLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(self.padding, self.padding, self.bounds.size.width - self.padding * 2, self.bounds.size.height - self.padding * 2);
}

@end
