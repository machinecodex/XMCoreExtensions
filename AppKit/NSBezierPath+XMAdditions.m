//
//  NSBezierPath+CLExtensions.m
//  DateLine
//
//  Created by Alex Clarke on 10/05/05.
//  Copyright 2005 CocoaLab. All rights reserved.
//  Stolen from CocoaDev

#import "NSBezierPath+XMAdditions.h"

@class NSBezierPath;

@implementation NSBezierPath (CLExtensions)

+ (void) fillRoundRectInRect:(NSRect)rect radius:(float)radius gradient:(NSGradient *)gradient {
	
	NSBezierPath * p = [self bezierPathWithRoundRectInRect:rect radius:radius];
	[gradient drawInBezierPath:p angle:90];
}

+ (void) fillRoundRectInRect:(NSRect)rect radius:(float) radius {
	
	NSBezierPath * p = [self bezierPathWithRoundRectInRect:rect radius:radius];
	[p fill];
}

+ (void) strokeRoundRectInRect:(NSRect)rect radius:(float)radius lineWidth:(float)width {
	
	NSBezierPath * p = [self bezierPathWithRoundRectInRect:rect radius:radius];
	[p setLineWidth:width];
	[p stroke];
}

+ (void) strokeRoundRectInRect:(NSRect)rect radius:(float)radius {

	[self strokeRoundRectInRect:rect radius:radius lineWidth:1.0];
}

+ (NSBezierPath*) bezierPathWithRoundRectInRect:(NSRect)aRect radius:(float)radius {
	
	NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:aRect xRadius:radius yRadius:radius];
	return path;
}

@end
