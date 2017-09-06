//
//  FormatUtils.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 6/9/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "FormatUtils.h"

@implementation FormatUtils
+ (NSString *)stringForNumber:(int)number {
    NSString *appendingText;
    switch (number % 10) {
        case 0:
            appendingText = @"th";
            break;
        case 1:
            appendingText = @"st";
            break;
        case 2:
            appendingText = @"nd";
            break;
        case 3:
            appendingText = @"rd";
            break;
        case 4:
            appendingText = @"th";
            break;
        case 5:
            appendingText = @"th";
            break;
        case 6:
            appendingText = @"th";
            break;
        case 7:
            appendingText = @"th";
            break;
        case 8:
            appendingText = @"th";
            break;
        case 9:
            appendingText = @"th";
            break;
        default:
            appendingText = @"";
            break;
    }
    return [NSString stringWithFormat:@"%d%@", number, appendingText];
}
@end
