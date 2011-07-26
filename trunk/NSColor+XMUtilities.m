//
//  NSColor+CLExtensions.m
//  DateLine
//
//  Created by Alex Clarke on 24/05/05.
//  Copyright 2005 CocoaLab. All rights reserved.
//

#import "NSColor+XMUtilities.h"

@implementation NSColor (XMUtilities)


#pragma mark -
#pragma mark Utilities

float randomFloat(void)
{
	return random() / (double)2147483647;
}

+ (NSColor *) randomColor {
	
	float r, g, b, a;
	
	r = randomFloat();
	g = randomFloat();
	b = randomFloat();
	a = 1.0;
	
	return [NSColor colorWithCalibratedRed:r green:g blue:b alpha:a];	
}

@end
