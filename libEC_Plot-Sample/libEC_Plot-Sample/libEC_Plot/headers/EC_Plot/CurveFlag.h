//
//  CurveFlag.h
//  PlotSample
//
//  Created by iphone4 on 11-6-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "AreaPlotBase.h"
#import "IPointCountFixedPlot.h"
	
@interface CurveFlag : AreaPlotBase< IPointCountFixedPlot> {
@private
		
}
-(id) initWithControlPoint:(NSArray *)points;
	
@end