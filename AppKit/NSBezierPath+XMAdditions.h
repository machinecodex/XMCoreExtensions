//
//  NSBezierPath+CLExtensions.h
//  DateLine
//
//  Created by Alex Clarke on 10/05/05.
//  Copyright 2005 CocoaLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSBezierPath (CLExtensions)

+ (void) fillRoundRectInRect:(NSRect)rect radius:(float)radius gradient:(NSGradient *)gradient;
+ (void) fillRoundRectInRect:(NSRect)rect radius:(float)radius;
+ (void) strokeRoundRectInRect:(NSRect)rect radius:(float) radius;
+ (void) strokeRoundRectInRect:(NSRect)rect radius:(float)radius lineWidth:(float)width;
+ (NSBezierPath*) bezierPathWithRoundRectInRect:(NSRect)aRect radius:(float)radius;

@end
