//
//  DateUtils.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 7/14/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "DateUtils.h"
#import "DeviceUtils.h"

@implementation DateUtils

+ (BOOL)sameDay:(NSDate *)date1 as:(NSDate *)date2 {
    NSDateComponents *date1Components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date1];
    NSDateComponents *date2Components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date2];
    
    return date1Components.day == date2Components.day && date1Components.month == date2Components.month && date1Components.year == date2Components.year;
}

+ (BOOL)is:(NSDate *)date1 after:(NSDate *)date2 {
    NSDateComponents *date1Components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date1];
    NSDateComponents *date2Components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date2];
    if(date1Components.year > date2Components.year) {
        return YES;
    } else if(date1Components.year < date2Components.year) {
        return NO;
    } else if(date1Components.month > date2Components.month) {
        return YES;
    } else if(date1Components.month < date2Components.month) {
        return NO;
    } else if(date1Components.day < date2Components.day) {
        return YES;
    } else if(date1Components.day < date2Components.day) {
        return NO;
    }
    
    //Same Day
    return NO;
}

+ (BOOL)date:(NSDate *)date1 isEarlierThan:(NSDate *)date2 {
    NSComparisonResult result = [date1 compare:date2];
    if(result == NSOrderedAscending) {
        return YES;
    } else if(result == NSOrderedDescending) {
        return NO;
    } else if(result == NSOrderedSame) {
        return NO;
    }
    return NO;
}

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)formatString {
    static NSMutableDictionary *dateFormatters;
    if(dateFormatters == nil) {
        dateFormatters = [[NSMutableDictionary alloc] init];
    }
    
    if([dateFormatters objectForKey:formatString]) {
        return [dateFormatters objectForKey:formatString];
    } else {
        NSDateFormatter *newFormatter = [[NSDateFormatter alloc] init];
        [newFormatter setDateFormat:formatString];
        [dateFormatters setObject:newFormatter forKey:formatString];
        return newFormatter;
    }
}


+ (NSDateFormatter *)displayDateFormatter {
    return [DateUtils dateFormatterWithFormat:IS_IPHONE_5_OR_LESS ? @"EEE, MMMM d" : @"EEEE, MMMM d"];
}

+ (NSDateFormatter *)displayTwoLinesDateFormatter {
    return [DateUtils dateFormatterWithFormat:@"EEEE\nMMMM d"];
}

+ (NSDateFormatter *)standardDateFormatter {
    return [DateUtils dateFormatterWithFormat:@"yyyy-MM-dd"];
}

+ (NSDateFormatter *) completeDetailsDateFormatter {
    return [DateUtils dateFormatterWithFormat:@"yyyy-MM-dd h:mm:ss a v"];
}

+ (NSString *)displayDateString:(NSDate *)date {
    return [[DateUtils displayDateFormatter] stringFromDate:date];
}

+ (NSString *)displayTwoLinesDateString:(NSDate *)date {
    return [[DateUtils displayTwoLinesDateFormatter] stringFromDate:date];
}

+ (NSString *)standardDateString:(NSDate *)date {
    return [[DateUtils standardDateFormatter] stringFromDate:date];
}

+ (NSString *)completeDetailsDateString:(NSDate *)date {
    return [[DateUtils completeDetailsDateFormatter] stringFromDate:date];
}

@end
