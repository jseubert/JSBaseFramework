//
//  DateUtils.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 7/14/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

+ (BOOL)sameDay:(NSDate *)date1 as:(NSDate *)date2;
+ (BOOL)is:(NSDate *)date1 after:(NSDate *)date2;
+ (BOOL)date:(NSDate *)date1 isEarlierThan:(NSDate *)date2;

+ (NSDateFormatter *)displayDateFormatter;
+ (NSDateFormatter *)displayTwoLinesDateFormatter;
+ (NSDateFormatter *)standardDateFormatter;
+ (NSDateFormatter *) completeDetailsDateFormatter;

+ (NSString *)displayDateString:(NSDate *)date;
+ (NSString *)displayTwoLinesDateString:(NSDate *)date;
+ (NSString *)standardDateString:(NSDate *)date;
+ (NSString *)completeDetailsDateString:(NSDate *)date;

@end
