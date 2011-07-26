//
//  NSDate+XMAdditions.h
//  DateLine 2
//
//  Created by Alex Clarke on 10/04/11.
//  Copyright 2011 MachineCodex Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (XMAdditions)

- (NSInteger) year;
- (NSInteger) month;
- (NSInteger) day;
- (NSInteger) hour;
- (NSInteger) minute;
- (NSInteger) second;

- (NSString *) dateString;
- (NSString *) timeString;

- (NSDate *) firstMinute;
- (NSDate *) lastMinute;
- (NSDate *) midday;

- (NSDate *) oneHourLater;
- (NSDate *) dateByAddingMonths:(NSInteger)months;
- (NSDate *) nextDate;
- (NSDate *) previousDate;
- (NSInteger) countOfMonthsSinceDate:(NSDate *)aDate;
- (NSInteger) countOfWeeksSinceDate:(NSDate *)aDate;

- (NSComparisonResult) compareToFirstMinuteOfDate:(NSDate *)date;
- (NSComparisonResult) compareToFirstDateOfMonth;

//+ (NSUInteger) firstDayOfWeekIniCal;
+ (void) setFirstDayOfWeekIniCal:(NSUInteger)value;

- (NSUInteger) weekNumberForTimeZone:(NSTimeZone *)timeZone;

- (BOOL) isToday;
- (BOOL) isApresMatin;
- (BOOL) isFirstDayOfWeek;
- (BOOL) isFirstDayOfMonth;

- (id)dateByAddingTimeInterval:(NSTimeInterval)seconds;

@end
