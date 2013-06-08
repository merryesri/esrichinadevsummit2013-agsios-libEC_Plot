//
//  PlotSampleViewController.h
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>
#import "EC_Plot.h"

typedef enum _plotType
{
	pt_simpleArrow=1,
	pt_customArrow=2,
	pt_tailedArrow=3,
	pt_customTailedArrow=4,
	pt_straightArrow=5,
	pt_doubleArrow=6,
	pt_assemblyArea=7,
	pt_circle = 8,
	pt_triangleFlag=9,
	pt_rectFlag=10,
	pt_curveFlag=11
}PlotType;

@interface PlotSampleViewController : UIViewController<AGSMapViewLayerDelegate,TouchViewDelegate> {
	AGSMapView *_mapView;
	SimpleArrow *_arrow;
	CustomArrow * _cArrow;
	CustomTailedArrow * _ctArrow;
	TailedArrow *_tArrow;
	StraightArrow * _sArrow;
	DoubleArrow *_dArrow;
	AssemblyArea *_assemblyArea;
	Circle       *_circle;
	TriangleFlag *_triangleFlag;
	RectFlag     *_rectFlag;
	CurveFlag    *_curveFlag;
	int _numberOfPoints;
	int _controlPoints;
	NSMutableArray *_pointArray;
	AGSGraphicsLayer *_graphicsLayer;
	UITouchView * touchView ;
	BOOL      _isCreate;
	PlotType  _plotType;
	BOOL      _isFinished;
	BOOL      _isAddTouchView;
}

@property (nonatomic, retain) IBOutlet AGSMapView *mapView;
@property (nonatomic, retain) AGSGraphicsLayer *graphicsLayer;
@property (nonatomic, retain)  UITouchView * touchView ;

- (IBAction)Clear:(id)sender;

-(IBAction) drawSimpleArrow:(id) sender;
-(IBAction) drawTailedArrow:(id) sender;
-(IBAction) drawStraightArrow:(id) sender;
-(IBAction) drawDoubleArrow:(id) sender;
-(IBAction) drawAssemblyArea:(id) sender;
-(IBAction) drawCircle:(id) sender;
-(IBAction) drawRectFlag:(id) sender;
-(IBAction) drawTriangleFlag:(id) sender;
-(IBAction) drawDone:(id) sender;
@end

