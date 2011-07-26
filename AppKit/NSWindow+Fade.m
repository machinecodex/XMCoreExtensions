//
//  NSWindow+Fade.m
//  TalkingMoose
//
//  Created by Uli Kusterer on 22.06.05.
//  Copyright 2005 M. Uli Kusterer. All rights reserved.
//

#import "NSWindow+Fade.h"

static NSMutableDictionary*     pendingFades = nil;
static float durationScalar = 0.05;

@implementation NSWindow (UKFade)

-(void)     fadeInWithDuration: (NSTimeInterval)duration
{
    if( !pendingFades )
        pendingFades = [[NSMutableDictionary alloc] init];
    
    NSString*       key = [NSString stringWithFormat: @"%lx", self];
    NSDictionary*   fade = [pendingFades objectForKey: key];
    
    if( fade )      // Currently fading that window? Abort that fade:
        [[fade objectForKey: @"timer"] invalidate];  // No need to remove from pendingFades, we'll replace it in a moment.
    
    [self setAlphaValue: 0];
    [self orderFront: nil];
    
    NSTimeInterval  interval = duration / durationScalar;
    float           stepSize = 1 / interval;
    NSTimer*        timer = [NSTimer scheduledTimerWithTimeInterval: durationScalar	// scheduled since we also want "normal" run loop mode.
                                target: self selector: @selector(fadeInOneStep:)
                                userInfo: nil repeats: YES];
    [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSModalPanelRunLoopMode];
    [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSEventTrackingRunLoopMode];
    [pendingFades setObject: [NSMutableDictionary dictionaryWithObjectsAndKeys: timer, @"timer",
                                                [NSNumber numberWithFloat: stepSize], @"stepSize",
                                                nil] forKey: key];    // Releases of any old fades.
}


-(void) fadeInOneStep: (NSTimer*)timer
{
    NSString*   key = [NSString stringWithFormat: @"%lx", self];
    float       newAlpha = [self alphaValue] + [[[pendingFades objectForKey: key] objectForKey: @"stepSize"] floatValue];
    
    if( newAlpha >= 1.0 )
    {
        newAlpha = 1;
        [timer invalidate];
        [pendingFades removeObjectForKey: key];
		//NSLog(@"window finished fading in");
		[[NSNotificationCenter defaultCenter] 
		 postNotificationName:@"kWindowDidFinishFadeIn" 
		 object:self];
		
    }
    
    //NSLog(@"Fading in: %f", newAlpha);		// DEBUG ONLY!
    [self setAlphaValue: newAlpha];
}


-(void)     fadeOutWithDuration: (NSTimeInterval)duration
{
    if( !pendingFades )
        pendingFades = [[NSMutableDictionary alloc] init];
    
    NSString*       key = [NSString stringWithFormat: @"%lx", self];
    NSDictionary*   fade = [pendingFades objectForKey: key];
    
    if( fade )      // Currently fading that window? Abort that fade:
        [[fade objectForKey: @"timer"] invalidate];  // No need to remove from pendingFades, we'll replace it in a moment.
    
    [self setAlphaValue: 1.0];
    
    NSTimeInterval  interval = duration / durationScalar;
    float           stepSize = 1 / interval;
    NSTimer*        timer = [NSTimer scheduledTimerWithTimeInterval: durationScalar				// scheduled since we also want "normal" run loop mode.
                                target: self selector: @selector(fadeOutOneStep:)
                                userInfo: nil repeats: YES];
    [pendingFades setObject: [NSMutableDictionary dictionaryWithObjectsAndKeys: timer, @"timer",
                                                [NSNumber numberWithFloat: stepSize], @"stepSize",
                                                nil] forKey: key];    // Releases of any old fades.
    [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSModalPanelRunLoopMode];
    [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSEventTrackingRunLoopMode];
}

-(void) fadeOutOneStep: (NSTimer*)timer
{
	NSString*			key = [NSString stringWithFormat: @"%lx", self];
	NSMutableDictionary*	currFadeDict = [[[pendingFades objectForKey: key] retain] autorelease];	// Make sure it doesn't go away in case we're cross-fading layers.
	float				newAlpha = [self alphaValue] - [[currFadeDict objectForKey: @"stepSize"] floatValue];
    
	if( newAlpha <= 0 )
	{
		[timer invalidate];
		[pendingFades removeObjectForKey: key];
		newAlpha = 0;
		if(![currFadeDict objectForKey:@"keepOpen"])
		{
			//NSLog(@"closing window: %f", newAlpha);		
			newAlpha = 1;
			[self close];
		}
		//else
			//[self orderOut:nil];
	}

	[self setAlphaValue: newAlpha];
}


-(void)fadeToLevel: (int)lev withDuration: (NSTimeInterval)duration keepOpen:(BOOL)keepOpen
{
	if(lev == [self alphaValue])
		return;
	
	if( !pendingFades )
		pendingFades = [[NSMutableDictionary alloc] init];
    
	NSString*       key = [NSString stringWithFormat: @"%lx", self];
	NSDictionary*   fade = [pendingFades objectForKey: key];
    
	if( fade )      // Currently fading that window? Abort that fade:
		[[fade objectForKey: @"timer"] invalidate];  // No need to remove from pendingFades, we'll replace it in a moment.
    
	BOOL fadesIn = (lev > 0.5);
	
	NSTimeInterval  interval = (duration /2) / durationScalar;
	float           stepSize = 1 / interval;
	NSTimer*        timer = [NSTimer scheduledTimerWithTimeInterval: durationScalar // scheduled since we also want "normal" run loop mode.
                                target: self selector: fadesIn ? @selector(fadeInOneStep:) : @selector(fadeOutOneStep:)
                                userInfo: nil repeats: YES];
	[pendingFades setObject: [NSMutableDictionary dictionaryWithObjectsAndKeys: timer, @"timer",
                                                [NSNumber numberWithFloat: stepSize], @"stepSize",
                                                [NSNumber numberWithInt: lev], @"newLevel",
					@"YES", @"keepOpen",
                                                nil] forKey: key];    // Releases of any old fades.
	[[NSRunLoop currentRunLoop] addTimer: timer forMode: NSModalPanelRunLoopMode];
	[[NSRunLoop currentRunLoop] addTimer: timer forMode: NSEventTrackingRunLoopMode];
}


@end
