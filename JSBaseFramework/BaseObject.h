//
//  BaseObject.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 5/29/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObject : NSObject <NSCoding>

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *objectDescription;

- (void) updateValuesWithDictionary:(NSDictionary*)dict;

@end
