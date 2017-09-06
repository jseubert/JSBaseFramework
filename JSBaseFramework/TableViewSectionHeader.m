//
//  TableViewSectionHeader.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/7/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "TableViewSectionHeader.h"

#import "NSString+Size.h"
#import "UILabel+Size.h"
#import "UIFont+Defaults.h"
#import "UIColor+Defaults.h"
#import "UIView+Size.h"

@interface TableViewSectionHeader()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation TableViewSectionHeader

- (id)init {
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor collectionViewBackgroundColor];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont defaultFont];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 0;
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(20, 0, self.width - 40, self.height);
}



@end
