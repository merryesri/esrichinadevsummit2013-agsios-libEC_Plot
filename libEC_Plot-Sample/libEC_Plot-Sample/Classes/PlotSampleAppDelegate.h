//
//  PlotSampleAppDelegate.h
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlotSampleViewController;

@interface PlotSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PlotSampleViewController *viewController;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PlotSampleViewController *viewController;

@end

