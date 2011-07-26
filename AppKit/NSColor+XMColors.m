//
//  Category.m
//  XMHUDWindow
//
//  Created by Alex Clarke on 25/07/11.
//  Copyright 2011 PowerMax. All rights reserved.
//

#import "NSColor+XMColors.h"

@implementation NSColor (XMColors)

#pragma mark -
#pragma mark Simple Colors

+ (NSColor *)xmWhite50Color
{
	float w = 1.0;
	NSColor * col = [NSColor colorWithCalibratedWhite:w alpha:0.5];
	return col;
}

+ (NSColor *)xmWhite85Color
{
	float w = 1.0;
	NSColor * col = [NSColor colorWithCalibratedWhite:w alpha:0.85];
	return col;
}

+ (NSColor *)xmLightGray50Color
{
	float w = 0.65;
	NSColor * col = [NSColor colorWithCalibratedWhite:w alpha:0.5];
	return col;
}

+ (NSColor *)xmDarkGray50Color
{
	float w = 0.25;
	NSColor * col = [NSColor colorWithCalibratedWhite:w alpha:0.5];
	return col;
}

+ (NSColor *)xmMidGray25Color
{
	float w = 0.25;
	NSColor * col = [NSColor colorWithCalibratedWhite:w alpha:0.5];
	return col;
}


#pragma mark -
#pragma mark UI Colors

+ (NSColor *)xmUnfocusedBackgroundColor
{
	float w = 0.15;
	NSColor * col = [NSColor colorWithCalibratedWhite:w alpha:1.0];
	return col;
}

+ (NSColor *)xmFocusedBackgroundColor
{
	float w = 0.15;
	NSColor * col = [NSColor colorWithCalibratedRed:w green:w blue:w alpha:1.0];
	return col;
}

+ (NSColor *)xmElementBackgroundColor
{
	float w = 0.2;
	NSColor * col = [NSColor colorWithCalibratedRed:w green:w blue:w alpha:1.0];
	return col;
}

+ (NSColor *)xmEventsBorderColor
{
	float w = 0.8;
	NSColor * col = [NSColor colorWithCalibratedRed:w green:w blue:w alpha:0.5];
	return col;	
}

+ (NSColor *)xmCalendarBackgroundColor
{
	float w = 0.1;
	NSColor * col = [NSColor colorWithCalibratedRed:w green:w blue:w alpha:0.8];
	return col;
}

@end
