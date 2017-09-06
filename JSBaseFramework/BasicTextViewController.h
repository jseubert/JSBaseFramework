//
//  BasicTextViewController.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/18/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicTextViewController : UIViewController

@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end
