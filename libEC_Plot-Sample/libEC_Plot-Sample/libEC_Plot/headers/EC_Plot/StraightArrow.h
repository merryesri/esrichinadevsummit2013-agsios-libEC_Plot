//
//  StraightArrow.h
//  PlotSample
//
//  Created by iphone4 on 11-6-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AreaPlotBase.h"
@interface StraightArrow : AreaPlotBase {
@private
	double _headHeightFactor;
	double _headWidthFactor;
	double _neckHeightFactor;
	double _neckWidthFactor;
	double _tailWidthFactor;
	
}
-(id) initWithControlPoint:(NSArray *)points;


@end
