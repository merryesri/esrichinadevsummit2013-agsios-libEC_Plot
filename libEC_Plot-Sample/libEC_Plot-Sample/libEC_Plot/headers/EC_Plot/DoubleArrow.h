//
//  DoubleArrow.h
//  PlotSample
//
//  Created by iphone4 on 11-6-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AreaPlotBase.h"
#import "IPointCountFixedPlot.h"


@interface DoubleArrow : AreaPlotBase<IPointCountFixedPlot> {
@private
	double _headHeightFactor;
	double _headWidthFactor;
	double _neckHeightFactor;
	double _neckWidthFactor;
	
	AGSPoint * _connPoint;
	AGSPoint *_tempPoint4;

}
-(id) initWithControlPoint:(NSArray *)points;

@end
