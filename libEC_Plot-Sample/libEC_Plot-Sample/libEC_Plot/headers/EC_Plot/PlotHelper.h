//
//  PlotHelper.h
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>
typedef enum _plotSide
{
	ps_unknown=0,
	ps_left= 1,
	ps_right=2
}PlotSide;

typedef enum _plotLineFit
{
	
	plf_bezier = 1,
	plf_bspline=2
}LineFit;
@interface PlotHelper : NSObject {

}
+(NSArray *) getArrowPlotWithPoints:(NSArray *) points 
				hasSwallowTail:(BOOL) hasSwallowTail
				swallTailFactor:(double)swallTailFactor
curveFitMesthod:(LineFit)curveFitMesthod 
headHeightFactor:(double)headHeightFactor 
headWidthFactor:(double)headWidthFactor
neckHeightFactor:(double)neckHeightFactor
neckWidthFactor:(double)neckHeightFactor
tailWidthFactor:(double)tailWidthFactor;

+(NSArray *) getArrowHeadPoints:(NSArray *) points 
			   headHeightFactor:(double)headHeightFactor 
				headWidthFactor:(double)headWidthFactor
			   neckHeightFactor:(double)neckHeightFactor
				neckWidthFactor:(double)neckWidthFactor;

+(NSArray *) getArrowBodyPoints:(NSArray *) points 
			   neckLeftPoint:(AGSPoint *)neckLeftPoint 
			   neckRightPoint:(AGSPoint *)neckRightPoint
			   tailWidthFactor:(double)tailWidthFactor
				leftFactor:(double)leftFactor
					rightFactor:(double)rightFactor;

+(NSArray *) getArrowTailPoints:(NSArray *) points 
				  tailWidthFactor:(double)tailWidthFactor
				 hasSwallowTail:(BOOL) hasSwallowTail
				swallTailFactor:(double)swallTailFactor;

+(NSArray *) getBezierPoints:(NSArray *) points ;
+(NSArray *) getBSplinePoints:(NSArray *) points n:(int)n;
+(double) getBSplineFactorWithK:(int)k N:(int)n T:(double)t;
+(double) getQuadricBSplineFactorWithK:(int)k  T:(double)t;
+(double) getBinomialFactorWithN:(int)n  index:(int)index;
+(long) getFactorialWithN:(int)n;
+(double) getBaseLength:(NSArray *) points ;
+(double) getDistanceWithPnt1:(AGSPoint *) point1 andPnt2:(AGSPoint *) point2  ;
+(double) getWholeDistance:(NSArray *) points ;
+(AGSPoint *) getThirdPoint:(AGSPoint *) startPoint endPoint:(AGSPoint *) endPoint angle:(double)angle  length:(double)length side:(PlotSide)side  ;
+(double) getAngleOfThreePointsWithPnt1:(AGSPoint *) point1 andPnt2:(AGSPoint *) point2 andPnt3:(AGSPoint *) point3 ;
+(double) getAzimuthAngleWithStartPnt:(AGSPoint *) point1 andEndPnt:(AGSPoint *) point2  ;
+(AGSPoint *) getMidPointWithStartPnt:(AGSPoint *) point1 andEndPnt:(AGSPoint *) point2  ;
+(PlotSide) getSideWithPnt1:(AGSPoint *) point1 andPnt2:(AGSPoint *) point2 andPnt3:(AGSPoint *) point3 ;
+(NSArray *) getAdvanceBezierPoints:(NSArray *) points ;

@end
