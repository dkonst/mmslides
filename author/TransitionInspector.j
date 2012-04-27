/*
 * TransitionInspector.j
 * 
 * Copyright (c) 2012 Hendrik Holtmann
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

@import <AppKit/CPWindowController.j>
@import "Session.j"
@import "ConnectionController.j"
@import "SlidePropertiesView.j"

var TransitionInspectorSharedInstance    = nil;

@implementation TransitionInspector : CPWindowController
{
	SlidePropertiesView _slidePropertiesView;
}

+ (TransitionInspector)sharedTransitionInspector
{
	if (!TransitionInspectorSharedInstance)
		TransitionInspectorSharedInstance = [[TransitionInspector alloc] init];
    
	return TransitionInspectorSharedInstance;
}

+ (void)showInspector
{
	var inspector = [self sharedTransitionInspector];
	[inspector showWindow:self];
	[[[inspector window] contentView] setData];
}

- (id)init
{
	var theWindow = [[CPPanel alloc] initWithContentRect:CGRectMake(40, 200, 400, 370) styleMask:CPClosableWindowMask];
        
	self = [super initWithWindow:theWindow];
	if (self)
	{
		[theWindow setTitle:@"Slide Properties"];
		[theWindow setLevel:CPFloatingWindowLevel];
		[theWindow setDelegate:self];

		_slidePropertiesView = [[SlidePropertiesView alloc] initWithFrame:CGRectMake(0,0,400,370)];
		[theWindow setContentView:_slidePropertiesView];
	}
	return self;
}	

- (void)windowWillClose:(id)aSender
{
}

@end