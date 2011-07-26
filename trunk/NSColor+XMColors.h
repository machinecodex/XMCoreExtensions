//
//  Category.h
//  XMHUDWindow
//
//  Created by Alex Clarke on 25/07/11.
//  Copyright 2011 PowerMax. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSColor (XMColors)

+ (NSColor *)xmWhite50Color;
+ (NSColor *)xmWhite85Color;
+ (NSColor *)xmLightGray50Color;
+ (NSColor *)xmDarkGray50Color;
+ (NSColor *)xmMidGray25Color;

+ (NSColor *)xmUnfocusedBackgroundColor;
+ (NSColor *)xmFocusedBackgroundColor;		

+ (NSColor *)xmElementBackgroundColor;		
+ (NSColor *)xmCalendarBackgroundColor;		
+ (NSColor *)xmEventsBorderColor;			

@end
