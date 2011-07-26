//
//  XMCGUtilities.h
//  XMHUDWindow
//
//  Created by Alex Clarke on 24/07/11.
//  Copyright 2011 PowerMax. All rights reserved.
//

#pragma mark -
#pragma mark NSColor to CGColor

static CGColorRef CGColorCreateFromNSColor(CGColorSpaceRef colorSpace, NSColor *color) {
    
    NSColor *deviceColor = [color colorUsingColorSpaceName:
                            NSDeviceRGBColorSpace];
    CGFloat components[4];
    [deviceColor getRed: &components[0] 
                  green: &components[1] 
                   blue: &components[2] 
                  alpha: &components[3]];
    
    return CGColorCreate (colorSpace, components);
}

static CGColorRef CGColorCreateRGBFromNSColor(NSColor *color) {
    
    CGColorSpaceRef ref = CGColorSpaceCreateDeviceRGB();
	CGColorRef col = CGColorCreateFromNSColor(ref, color);
	CGColorSpaceRelease(ref);
    return col;
}

