//
//  NSGradient+XMUtilities.m
//  XMGradientPanel
//
//  Created by Alex Clarke on 23/07/11.
//  Copyright 2011 PowerMax. All rights reserved.
//

#import "NSGradient+XMUtilities.h"

@implementation NSGradient (XMUtilities)


#pragma mark -
#pragma mark Utilities

+ (NSGradient *) reverseGradient:(NSGradient *)inGradient {
    
	NSInteger			aNumberOfStops = [inGradient numberOfColorStops];
	NSMutableArray *	aColorList = [NSMutableArray array];
	CGFloat				aLocationList[aNumberOfStops];
	
	NSInteger i;
	for(i = aNumberOfStops - 1; i >= 0; i--)	{
        
		NSColor *	aStopColor = nil;	
		CGFloat		aLocation = 0;
		
		[inGradient getColor:&aStopColor location:&aLocation atIndex:i];
		[aColorList addObject:aStopColor];
		aLocationList[i] = aLocation;
	}
    
	NSGradient * outGradient = [[[NSGradient alloc] initWithColors:aColorList atLocations:aLocationList colorSpace:[NSColorSpace genericRGBColorSpace]]autorelease];
    return outGradient;
}


#pragma mark -
#pragma mark Convenience constructors

+ (id) gradientFromColor:(NSColor *)color1 toColor:(NSColor *)color2 {
	
	CGFloat position1 = 0;
	CGFloat position2 = 1;
	
	id newInstance = [[[self class] alloc] initWithColorsAndLocations: 
					  
					  color1, position1,
					  color2, position2,
					  
					  nil];
	
	return [newInstance autorelease];	
}

+ (id) glossyGradientWithMidpoint:(CGFloat)midpoint color1:(NSColor *)color1 color2:(NSColor *)color2 color3:(NSColor *)color3 color4:(NSColor *)color4 {
    
	CGFloat position1 = 0;
	CGFloat position2 = midpoint;
	CGFloat position3 = midpoint;
	CGFloat position4 = 1;
    
	id newInstance = [[NSGradient alloc] initWithColorsAndLocations: 
					  
					  color1, position1,
					  color2, position2,
					  color3, position3,
					  color4, position4,
					  
					  nil];
	
	return [newInstance autorelease];   
}

+ (id) glossyGradientWithTint:(NSColor *)tint andAlpha:(CGFloat)alpha withMode:(NSUInteger)mode {
    
    NSColor * highlight = mode ? [NSColor blackColor] : [NSColor whiteColor];
    
    NSColor * c1 = [[tint blendedColorWithFraction:0.45 ofColor:highlight] colorWithAlphaComponent:alpha];
    NSColor * c2 = [[tint blendedColorWithFraction:0.20 ofColor:highlight] colorWithAlphaComponent:alpha];
    NSColor * c3 = [[tint blendedColorWithFraction:0.15 ofColor:highlight] colorWithAlphaComponent:alpha];
    NSColor * c4 = [[tint blendedColorWithFraction:0.05 ofColor:highlight] colorWithAlphaComponent:alpha];
    
    return [self glossyGradientWithMidpoint:0.5 color1:c1 color2:c2 color3:c3 color4:c4];
}

+ (id) glossyGradientWithTint:(NSColor *)tint andAlpha:(CGFloat)alpha {
        
    return [self glossyGradientWithTint:tint andAlpha:alpha withMode:1];
}

+ (id) glossyGradientWithTint:(NSColor *)tint {
    
    CGFloat alpha = 0.25;
    return [self glossyGradientWithTint:tint andAlpha:alpha];
}


@end
