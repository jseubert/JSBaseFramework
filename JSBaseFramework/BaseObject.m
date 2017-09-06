//
//  BaseObject.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 5/29/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "BaseObject.h"


@implementation BaseObject

- (id)init {
    self = [super init];
    if (self) {
        self.objectId = @"";
        self.objectDescription = @"";
    }
    return self;
}

#pragma mark -
#pragma mark NSCoding methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [self init]) {

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
}

#pragma mark -
#pragma mark NSKeyValueCoding  methods
-(void) setValue:(id)value forUndefinedKey:(NSString *)key {
}

- (void) updateValuesWithDictionary:(NSDictionary*)dict {
    id keyValue;
    for (NSString * key in dict) {
        keyValue = [dict objectForKey:key];
        if([key isEqualToString:@"id"]) {
            self.objectId = keyValue;
        } else if([key isEqualToString:@"description"]) {
            self.objectDescription = keyValue;
        } else {
            [self setValue:keyValue forKey:key];
        }
    }
}

@end
