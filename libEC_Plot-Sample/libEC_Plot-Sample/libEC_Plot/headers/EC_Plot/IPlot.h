//
//  IPlot.h
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGSPoint;
@protocol IPlot <NSObject>

- (void)pushPoint:(AGSPoint *)point;
- (void)popPoint;
- (int) getPointCount;
- (int) getMinPointCount;
- (void)create;
- (NSArray *) getControlPoints;
- (void)setControlPoints:(NSArray *) points;
- (void)updateControlPoint:(AGSPoint *)point withIndex:(int) index;
- (void)finishDraw;

@end
