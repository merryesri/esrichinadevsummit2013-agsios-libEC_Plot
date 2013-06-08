//
//  CustomArrow.h
//  PlotSample
//
//  Created by iphone4 on 11-6-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AreaPlotBase.h"
@interface CustomArrow  : AreaPlotBase {
@private
	double _headHeightFactor;
	double _headWidthFactor;
	double _neckHeightFactor;
	double _neckWidthFactor;
	AGSPoint * _headRightPnt;
	AGSPoint *_neckPnt;
}
-(id) initWithControlPoint:(NSArray *)points;
@end
