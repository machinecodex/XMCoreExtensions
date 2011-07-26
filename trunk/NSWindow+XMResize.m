//
//  NSWindow+XMResize.m
//  XMHUDWindow
//
//  Created by Alex Clarke on 26/07/11.
//  Copyright 2011 PowerMax. All rights reserved.
//

#import "NSWindow+XMResize.h"


@implementation NSWindow (XMResize)

- (CGFloat) width {
    
    return [self frame].size.width;
}

- (void) setWidth:(float)width animate:(BOOL)animate {
    
   	NSRect oldFrame = [self frame];
	float x = oldFrame.origin.x;
	float y = oldFrame.origin.y;
	float w = width;
	float h = oldFrame.size.height;
	
	NSRect frameRect = NSMakeRect(x, y, w, h);
	
	[self setFrame:frameRect display:YES animate:animate];	 
}

- (void) setWidth:(float)width {
    
	[self setWidth:width animate:YES];
}

- (CGFloat) height {
    
    return [self frame].size.height;
}

- (void) setHeight:(float)height animate:(BOOL)animate {
	
	NSRect oldFrame = [self frame];
	float x = oldFrame.origin.x;
	float y = oldFrame.origin.y;
	float w = oldFrame.size.width;
	float oldH = oldFrame.size.height;
	float h = height;
	
	float d = h - oldH;
	
	NSRect frameRect = NSMakeRect(x, y - d, w, h);
	
	[self setFrame:frameRect display:YES animate:animate];
}

- (void) setHeight:(float)height {
    
	[self setHeight:height animate:YES];
}

@end
