//
//  NSDate+XMAdditions.m
//  DateLine 2
//
//  Created by Alex Clarke on 10/04/11.
//  Copyright 2011 MachineCodex Software. All rights reserved.
//

#import "NSDate+XMAdditions.h"


@implementation NSDate (XMAdditions)


#pragma mark -
#pragma mark Formatted Strings

- (NSString *) dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	[dateFormatter setLocale:[NSLocale currentLocale]];
	
	NSString * date = [dateFormatter stringFromDate:self];
	[dateFormatter release];
	return date;
}

- (NSString *) longDateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	[dateFormatter setDateStyle:NSDateFormatterLongStyle];
	[dateFormatter setLocale:[NSLocale currentLocale]];
	
	NSString * date = [dateFormatter stringFromDate:self];
	[dateFormatter release];
	return date;
}

- (NSString *) fullDateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDoesRelativeDateFormatting:YES];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	[dateFormatter setDateStyle:NSDateFormatterFullStyle];
	[dateFormatter setLocale:[NSLocale currentLocale]];
	
	NSString * date = [dateFormatter stringFromDate:self];
	[dateFormatter release];
	return date;
}

- (NSString *) timeString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	[dateFormatter setDateStyle:NSDateFormatterNoStyle];
	[dateFormatter setLocale:[NSLocale currentLocale]];
	
	NSString * date = [dateFormatter stringFromDate:self];
	[dateFormatter release];
	return date;
}


#pragma mark -
#pragma mark Components

- (NSInteger) year {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents * comps = [calendar components:NSYearCalendarUnit fromDate:self];
	return [comps year];	
}

- (NSInteger) month {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
    
	NSDateComponents * comps = [calendar components:NSMonthCalendarUnit fromDate:self];
	return [comps month];
}

- (NSInteger) day {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents * comps = [calendar components:NSDayCalendarUnit fromDate:self];
	return [comps day];
}

- (NSInteger) hour {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents * comps = [calendar components:NSHourCalendarUnit fromDate:self];
	return [comps hour];
}

- (NSInteger) minute {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents * comps = [calendar components:NSMinuteCalendarUnit fromDate:self];
	return [comps minute];
}

- (NSInteger) second {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents * comps = [calendar components:NSSecondCalendarUnit fromDate:self];
	return [comps second];
}


#pragma mark -
#pragma mark Relative Dates

- (BOOL) isSameDayAs:(NSDate *)date {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 day]  == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

- (id) dateByAddingTimeInterval:(NSTimeInterval)seconds {
	
	NSDate * date = [NSDate dateWithString:[self description]];
	return [[[NSDate alloc] initWithTimeInterval:seconds sinceDate:date] autorelease];	
}

- (NSDate *) firstMinute {
    
   	// Return a Date object with the day, month and year, time 00:00:00.
	NSCalendar * calendar = [NSCalendar currentCalendar];
    
	NSInteger year = [self year];
	NSInteger month = [self month];
	NSInteger day = [self day];
	
	// Create date zero time
	NSDateComponents * comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setDay:day]; [comps setMonth:month]; [comps setYear:year];
    [comps setHour:0]; [comps setMinute:0]; [comps setSecond:0];
	
	return [calendar dateFromComponents:comps]; 
}

- (NSDate *) lastMinute {
    
  	// Return a Date object with the day, month and year, time 23:59:59
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSInteger year = [self year];
	NSInteger month = [self month];
	NSInteger day = [self day];
    
	// Create last minute time
	NSDateComponents * comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setDay:day]; [comps setMonth:month]; [comps setYear:year]; 
	[comps setHour:23]; [comps setMinute:59]; [comps setSecond:59];
	
	return [calendar dateFromComponents:comps];  
}

- (NSDate *) midday {
    
  	// Return a Date object with the day, month and year, time 23:59:59
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSInteger year = [self year];
	NSInteger month = [self month];
	NSInteger day = [self day];
	
	// Create last minute time
	NSDateComponents * comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setDay:day]; [comps setMonth:month]; [comps setYear:year]; 
	[comps setHour:12]; [comps setMinute:00]; [comps setSecond:00];
	
	return [calendar dateFromComponents:comps];  
}

- (NSDate *) oneHourLater {
    
    // Return a Date object with the day, month and year, time 23:59:59
	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSInteger year = [self year];
	NSInteger month = [self month];
	NSInteger day = [self day];
	NSInteger hour = [self hour];
	NSInteger minute = [self minute];
	NSInteger second = [self second];
	
	// Create last minute time
	NSDateComponents * comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setDay:day]; [comps setMonth:month]; [comps setYear:year]; 
	[comps setHour:hour + 1]; [comps setMinute:minute]; [comps setSecond:second];
	
	return [calendar dateFromComponents:comps];
}

- (NSDate *) dateByAddingMonths:(NSInteger)months {
    
 	NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSInteger month = [self month];
	NSInteger day = [self day];
	
	// Create last minute time
	NSDateComponents * comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setDay:day]; [comps setMonth:month + months];
	[comps setHour:0]; [comps setMinute:0]; [comps setSecond:0];
	
	return [calendar dateFromComponents:comps];   
}

- (NSDate *) nextDate {
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	[comps setDay:1];
	
	NSDate * date = [calendar dateByAddingComponents:comps toDate:self options:0];
	
	[comps release];
	
	return [date firstMinute];
}

- (NSDate *) previousDate {
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	[comps setDay:-1];
	
	NSDate * date = [calendar dateByAddingComponents:comps toDate:self options:0];
	
	[comps release];
	
	return [date firstMinute];
}

- (NSDate *) firstDateOfMonthWithMonth:(NSInteger)month year:(NSInteger)year{
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSDateComponents * comps = [[[NSDateComponents alloc] init] autorelease];
    
	[comps setDay:1];
	[comps setMonth:month];
	[comps setYear:year];
	return [calendar dateFromComponents:comps];	
}

- (NSDate *) firstDateOfMonth {
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
    
	// Get the year
	NSDateComponents *yearComps = [calendar components:NSYearCalendarUnit fromDate:self];
	NSInteger year = [yearComps year];
	
	// Get the month
	NSDateComponents * monthComps;
	monthComps = [calendar components:NSMonthCalendarUnit fromDate:self];
	NSInteger month = [monthComps month];	
	
	return [self firstDateOfMonthWithMonth:month year:year];
}

- (BOOL) isToday {
    
    return [[self firstMinute] compareToFirstMinuteOfDate:[NSDate date]] == NSOrderedSame;
}


- (BOOL) isApresMatin {
    
    if([self compare:[self midday]] == NSOrderedAscending) return YES;
    return NO;
}

- (BOOL) isFirstDayOfWeek {
    
    return TRUE;
}

- (BOOL) isFirstDayOfMonth {
    
    return [[self firstMinute] compare:[self firstDateOfMonth]] == NSOrderedSame;
}

- (NSInteger) countOfMonthsSinceDate:(NSDate *)aDate {
    
	NSCalendar * calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSMonthCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:aDate options:0];
    return [components month];
}

- (NSInteger) countOfWeeksSinceDate:(NSDate *)aDate {
    
	NSCalendar * calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSWeekCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:aDate options:0];
    return [components week];
}

#pragma mark -
#pragma mark Date comparisons

- (NSComparisonResult) compareToFirstMinuteOfDate:(NSDate *)date {
  
    // ---- Compare ONLY the year, month and day components of two dates
    
    if (!date) return NSOrderedDescending;
    
	NSDate * leftDateZero = [self firstMinute];
	NSDate * rightDateZero = [date firstMinute];
	
	return [leftDateZero compare:rightDateZero];
}

- (NSComparisonResult) compareToFirstDateOfMonth {
    
    return [[self firstMinute] compare:[self firstDateOfMonth]];
}

- (NSUInteger) firstWeekdayOfYear {
	
	// date is any date in the year in question.	
	// Returns an integer for the first weekday of the year, 1 = Sunday, 7 = Saturday
	
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSDateComponents *yearComps = [calendar components:NSYearCalendarUnit fromDate:self];
	NSUInteger year = [yearComps year];
    
	NSDateComponents * comps = [[NSDateComponents alloc] init];
	[comps setDay:1];
	[comps setMonth:1];
	[comps setYear:year];
	NSDate * firstDate = [calendar dateFromComponents:comps];
    
	[comps release];
    
	NSDateComponents *firstWeekdayComps = [calendar components:NSWeekdayCalendarUnit fromDate:firstDate];
	
	return [firstWeekdayComps weekday];
}

- (BOOL) isYearIso8601 {
	
	// date is any date in the year in question.	
	// Return true if the first week of the year includes a Thursday:
	// * ISO 8601: the week begins on a Monday, and in numbering the weeks in a year, 
	// week 1 of a year is to be the first week in the year that includes a Thursday.
	
	// Convert Cocoa's Sunday based weekday numbering to ISO 8601 (Monday based)
	NSUInteger firstWeekday = [self firstWeekdayOfYear];
	firstWeekday < 1 ? (firstWeekday = 7) : (firstWeekday = firstWeekday);
    
	if (firstWeekday <= 7) return YES;	
	return NO;
}

- (NSInteger) weekOfYear {
    
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSDateComponents * weekComps;
	weekComps = [calendar components:NSWeekCalendarUnit fromDate:self];
	NSInteger firstWeek = [self isYearIso8601] ? -1 : 0;
	NSInteger weekOfYear = [weekComps week] + firstWeek;
	
	return weekOfYear;
}


#pragma mark -
#pragma mark iCal Preferences

//+ (NSUInteger)firstDayOfWeekIniCal {
//	
//	NSInteger firstDayOfWeek = 0;
//	
//	//Try to look at the iCal preferences if possible
//	CFPropertyListRef iCalFirstDayOfWeek = CFPreferencesCopyAppValue(CFSTR("first day of week"),CFSTR("com.apple.iCal"));
//	
//	if (iCalFirstDayOfWeek) {
//		//This should return a CFNumberRef... we're using another app's prefs, so make sure.
//		if (CFGetTypeID(iCalFirstDayOfWeek) == CFNumberGetTypeID()) {
//			firstDayOfWeek = [(NSNumber *)iCalFirstDayOfWeek integerValue];
//		}
//		
//		CFRelease(iCalFirstDayOfWeek);
//	}
//	
//	return firstDayOfWeek;
//}

+ (void) setFirstDayOfWeekIniCal:(NSUInteger)value {
	
	//	CFPropertyListRef list = (CFPropertyListRef)[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%i", value], @"first day of week", nil];
	//	NSString * str = [NSString stringWithFormat:@"%i", value];
	//	CFStringRef string = CFStringCreateWithCString(NULL, [str UTF8String] , kCFStringEncodingUTF8);
	//						  string,
	
	//	CFNumberRef num = CFNumberCreate(NULL, kCFNumberIntType, &value);
	//	CFPreferencesSetValue(CFSTR("first day of week"), 
	//						  NULL,
	//						  CFSTR("com.apple.iCal"),
	//						  kCFPreferencesCurrentUser,
	//						  kCFPreferencesCurrentHost
	//						  );
	//	CFPreferencesAppSynchronize(CFSTR("com.apple.iCal"));
}


#pragma mark -
#pragma mark Week of year determintation

/* Adapted from:
 *	Algorithm for Converting Gregorian Dates to ISO 8601 Week Date
 *	Rick McCarty, 1999
 *	http://personal.ecu.edu/mccartyr/ISOwdALG.txt
 */

 #ifndef DEFAULT_TIME_SEPARATOR
 #define DEFAULT_TIME_SEPARATOR ':'
 #endif
 
static BOOL is_leap_year(NSUInteger year) {
    
    return ((year %   4U) == 0U)
    && (((year % 100U) != 0U)
        ||  ((year % 400U) == 0U));
}

- (NSUInteger) weekNumberForTimeZone:(NSTimeZone *)timeZone {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit fromDate:self];
    
    //Determine the ordinal date.
    NSDateComponents *startOfYearComponents = [calendar components:NSYearCalendarUnit fromDate:self];
    startOfYearComponents.month = 1;
    startOfYearComponents.day = 1;
    NSDateComponents *ordinalComponents = [calendar components:NSDayCalendarUnit fromDate:[calendar dateFromComponents:startOfYearComponents] toDate:self options:0];
    ordinalComponents.day += 1;
    
    enum {
        monday, tuesday, wednesday, thursday, friday, saturday, sunday
    };
    enum {
        january = 1, february, march,
        april, may, june,
        july, august, september,
        october, november, december
    };
    
    NSInteger year = components.year;
    NSInteger week = 0;
    NSInteger dayOfYear = ordinalComponents.day;
    
    NSInteger prevYear = year - 1;
    
    BOOL yearIsLeapYear = is_leap_year(year);
    BOOL prevYearIsLeapYear = is_leap_year(prevYear);
    
    NSInteger YY = prevYear % 100;
    NSInteger C = prevYear - YY;
    NSInteger G = YY + YY / 4;
    NSInteger Jan1Weekday = (((((C / 100) % 4) * 5) + G) % 7);
    
    NSInteger weekday = ((dayOfYear + Jan1Weekday) - 1) % 7;
    
    if((dayOfYear <= (7 - Jan1Weekday)) && (Jan1Weekday > thursday)) {
        week = 52 + ((Jan1Weekday == friday) || ((Jan1Weekday == saturday) && prevYearIsLeapYear));
        --year;
    } else {
        NSInteger lengthOfYear = 365 + yearIsLeapYear;
        if((lengthOfYear - dayOfYear) < (thursday - weekday)) {
            ++year;
            week = 1;
        } else {
            NSInteger J = dayOfYear + (sunday - weekday) + Jan1Weekday;
            week = J / 7 - (Jan1Weekday > thursday);
        }
    }
    
    return (NSUInteger)week;
}
 
@end