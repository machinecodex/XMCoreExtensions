//
//  NSWindow+XMResize.h
//  XMHUDWindow
//
//  Created by Alex Clarke on 26/07/11.
//  Copyright 2011 PowerMax. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSWindow (XMResize)

- (CGFloat) width;
- (void) setWidth:(float)width animate:(BOOL)animate;
- (void) setWidth:(float)width;

- (CGFloat) height;
- (void) setHeight:(float)height animate:(BOOL)animate;
- (void) setHeight:(float) height;

@end
