//
//  CustomtailedArrow.h
//  PlotSample
//
//  Created by iphone4 on 11-6-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AreaPlotBase.h"


@interface CustomTailedArrow  : AreaPlotBase {
@private
	double _headHeightFactor;
	double _headWidthFactor;
	double _neckHeightFactor;
	double _neckWidthFactor;
	double _tailWidthFactor;
	double _swallowTailFactor;
	
	AGSPoint * _headRightPnt;
	AGSPoint *_neckPnt;
	AGSPoint *_swallowTailPnt;
}
-(id) initWithControlPoint:(NSArray *)points;

@end
