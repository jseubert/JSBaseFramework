//
//  BasicTextViewController.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/18/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "BasicTextViewController.h"

#import "UIView+Size.h"
#import "UILabel+Size.h"
#import "UIFont+Defaults.h"

@interface BasicTextViewController ()

@end

@implementation BasicTextViewController

- (id)init {
    self = [super init];
    if(self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.padding = 10;
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.scrollView = [[UIScrollView alloc] init];
        [self.view addSubview:self.scrollView];
        
        self.textView = [[UITextView alloc] init];
        self.textView.scrollEnabled = NO;
        self.textView.font = [UIFont defaultFontWithSize:16];
        //self.textView.textAlignment = NSTextAlignmentLeft;
        self.textView.editable = NO;
        self.textView.selectable = YES;
        [self.scrollView addSubview:self.textView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    
    CGFloat contentHeight = self.padding * 2;
    CGFloat textViewPadding = self.textView.textContainer.lineFragmentPadding;
    CGRect textSize = [self.textView.attributedText boundingRectWithSize:CGSizeMake(self.view.width - (self.padding*2) - (textViewPadding*2), NSIntegerMax) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    self.textView.frame = CGRectMake(self.padding, self.padding, self.view.width - (self.padding*2), textSize.size.height + (textViewPadding*2) + (self.padding*2));
    self.textView.contentSize = CGSizeMake(self.view.width - (self.padding*2), textSize.size.height + (textViewPadding*2) + (self.padding*2));
    contentHeight += self.textView.height;
    
    self.scrollView.contentSize = CGSizeMake(self.view.width, contentHeight);
}

@end
