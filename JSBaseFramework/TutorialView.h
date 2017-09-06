//
//  TutorialView.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 8/22/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialView : UIView

- (id)initWithTutorials:(NSArray *)tutorialArray
            tutorialKey:(NSString *)tutorialKey
                  color:(UIColor *)detailColor;


@end

@interface Tutorial : NSObject

- (id)initForView:(CGRect)rect description:(NSString *)descriptionText;
- (id)initFor:(NSIndexPath *)indexPath inCollectionView:(UICollectionView*)collectionView desciprtion:(NSString *)descriptionText;

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, assign) CGRect rectToShow;

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
