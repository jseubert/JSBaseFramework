//
//  TutorialView.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/22/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "TutorialView.h"

#import "UIView+Size.h"
#import "UIFont+Defaults.h"
#import "UILabel+Size.h"

@interface TutorialView ()

@property (nonatomic, strong) NSArray *tutorialArray;
@property (nonatomic, strong) NSString *tutorialKey;

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIView *textLabelBackground;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation TutorialView

- (id)initWithTutorials:(NSArray *)tutorialArray
            tutorialKey:(NSString *)tutorialKey
                  color:(UIColor *)detailColor {
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.tutorialArray = tutorialArray;
        self.tutorialKey = tutorialKey;
        
        self.textLabelBackground = [[UIView alloc] init];
        self.textLabelBackground.layer.borderWidth = 2;
        self.textLabelBackground.layer.cornerRadius = 10;
        self.textLabelBackground.layer.borderColor = detailColor.CGColor;
        self.textLabelBackground.backgroundColor = [UIColor whiteColor];
        self.textLabelBackground.layer.masksToBounds = YES;
        [self addSubview:self.textLabelBackground];
        
        self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.nextButton addTarget:self action:@selector(didTapNextButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
        [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.nextButton.backgroundColor = detailColor;
        self.nextButton.layer.masksToBounds = YES;
        [self.textLabelBackground addSubview:self.nextButton];
        
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapNextButton:)];
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.userInteractionEnabled = YES;
        self.textLabel.font = [UIFont defaultFontWithSize:12.0f];
        self.textLabel.backgroundColor = [UIColor whiteColor];
        self.textLabel.numberOfLines = 0;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.layer.masksToBounds = YES;
        [self.textLabel addGestureRecognizer:gr];
        [self.textLabelBackground addSubview:self.textLabel];
        
        [self goToNextTutorial];
    }
    return self;
}

- (void)goToNextTutorial {
    Tutorial *tutorial = [self.tutorialArray firstObject];
    self.textLabel.text = tutorial.descriptionText;
    if(tutorial.collectionView) {
        UICollectionViewLayoutAttributes *attributes = [tutorial.collectionView layoutAttributesForItemAtIndexPath:tutorial.indexPath];
        if(CGRectContainsRect(tutorial.collectionView.bounds, attributes.frame)) {
            [self setNeedsDisplay];
            [self setNeedsLayout];
            return;
        }
        [tutorial.collectionView scrollToItemAtIndexPath:tutorial.indexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setNeedsDisplay];
            [self setNeedsLayout];
        });
    } else {
        [self setNeedsDisplay];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = 10;
    
    Tutorial *tutorial = [self.tutorialArray firstObject];
    CGRect rectToShow;
    if(tutorial.collectionView) {
        UICollectionViewLayoutAttributes *attributes = [tutorial.collectionView layoutAttributesForItemAtIndexPath:tutorial.indexPath];
        rectToShow = CGRectMake(attributes.frame.origin.x - tutorial.collectionView.contentOffset.x,
                                          attributes.frame.origin.y - tutorial.collectionView.contentOffset.y,
                                          attributes.bounds.size.width,
                                          attributes.bounds.size.height);
    } else {
        rectToShow = tutorial.rectToShow;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        //Draw above or below highlighted view
        BOOL drawOnTop = (rectToShow.origin.y + rectToShow.size.height/2.0f) > self.height/2.0f;
        CGSize textSize = [self.textLabel sizeOfLabelWithWithWidth:self.width - padding*4];
        CGSize tutorialViewSize = CGSizeMake(self.width - padding*2, textSize.height + 40 + padding*2);
        if(drawOnTop) {
            self.textLabelBackground.frame = CGRectMake(padding, rectToShow.origin.y - tutorialViewSize.height - padding, tutorialViewSize.width, tutorialViewSize.height);
        } else {
            self.textLabelBackground.frame = CGRectMake(padding, rectToShow.origin.y + rectToShow.size.height + padding, tutorialViewSize.width, tutorialViewSize.height);
        }
        
        self.textLabel.frame = CGRectMake(padding, padding, textSize.width, textSize.height);
        self.nextButton.frame = CGRectMake(0, tutorialViewSize.height - 40, tutorialViewSize.width, 40);
    }];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef ct = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ct, [UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor);
    CGContextFillRect(ct, self.bounds);
    
    Tutorial *tutorial = [self.tutorialArray firstObject];
    if(tutorial.collectionView) {
        UICollectionViewLayoutAttributes *attributes = [tutorial.collectionView layoutAttributesForItemAtIndexPath:tutorial.indexPath];
        CGContextClearRect(ct, CGRectMake(attributes.frame.origin.x - tutorial.collectionView.contentOffset.x,
                                           attributes.frame.origin.y - tutorial.collectionView.contentOffset.y,
                                           attributes.bounds.size.width,
                                           attributes.bounds.size.height));
    } else {
        CGContextClearRect(ct, tutorial.rectToShow);
    }
}

- (void)didTapNextButton:(UIButton *)button {
    if(self.tutorialArray && [self.tutorialArray count] > 1) {
        self.tutorialArray = [self.tutorialArray subarrayWithRange:NSMakeRange(1, self.tutorialArray.count - 1)];
        [self goToNextTutorial];
    } else {
        if(self.tutorialKey) {
            //Change Later?
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:self.tutorialKey];
        }
        [self removeFromSuperview];
    }
}

@end

@interface Tutorial ()
@end

@implementation Tutorial

- (id)initForView:(CGRect)rect description:(NSString *)descriptionText {
    self = [super init];
    if(self) {
        self.rectToShow = rect;
        self.descriptionText = descriptionText;
    }
    return self;
}

- (id)initFor:(NSIndexPath *)indexPath inCollectionView:(UICollectionView*)collectionView desciprtion:(NSString *)descriptionText {
    self = [super init];
    if(self) {
        self.indexPath = indexPath;
        self.collectionView = collectionView;
        self.descriptionText = descriptionText;
    }
    return self;
}


@end
