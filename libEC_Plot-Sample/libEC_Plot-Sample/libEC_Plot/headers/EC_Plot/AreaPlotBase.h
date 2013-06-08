//
//  AreaPlotBase.h
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>
#import "IPlot.h"

typedef enum _plotState
{
	ps_drawing = 1,
	ps_updating=2
}PlotState;


@interface AreaPlotBase : AGSMutablePolygon <IPlot>{
	@protected
	NSMutableArray * _cPoints;
	PlotState       _plotState;
}
-(id) initWithControlPoint:(NSArray *)points;

@end
