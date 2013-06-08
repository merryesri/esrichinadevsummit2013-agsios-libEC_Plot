//
//  PlotSampleAppDelegate.m
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "PlotSampleAppDelegate.h"
#import "PlotSampleViewController.h"

@implementation PlotSampleAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    
    [super dealloc];
}


@end
