//
//  PlotSampleViewController.m
//  PlotSample
//
//  Created by iphone4 on 11-6-22.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "PlotSampleViewController.h"

@implementation PlotSampleViewController

@synthesize mapView=_mapView;
@synthesize graphicsLayer=_graphicsLayer;
@synthesize touchView;


-(void)createPlotGeometry:(AGSMutablePolygon *) polygon{
    AGSSimpleFillSymbol *symbol = [AGSSimpleFillSymbol simpleFillSymbol];
	symbol.color = [UIColor redColor];
	symbol.style = AGSSimpleFillSymbolStyleSolid;
    
    AGSGraphic * gra = [[AGSGraphic alloc ]initWithGeometry:polygon
                                                     symbol:symbol
                                                 attributes:nil
                                       infoTemplateDelegate:nil];
    [self.graphicsLayer addGraphic:gra];
    
}
- (void)mapTouchesBegan:(CGPoint) point
{

	switch (_plotType) {
		case pt_simpleArrow:
		{
			if (_controlPoints == 0) {
				
				if (_arrow != nil) {
					[_arrow release];
					_arrow = nil;
				}
				_arrow=[[SimpleArrow alloc] initWithControlPoint:nil];
                _arrow.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				
                [self createPlotGeometry:_arrow];
                
				
			}
			[_arrow pushPoint:[self.mapView toMapPoint:point]];
						_controlPoints++;
		}
			break;
		case pt_customArrow:
		{
		}
			break;
		case pt_tailedArrow:
		{
			if (_controlPoints == 0) {
				
				if (_tArrow != nil) {
					[_tArrow release];
					_tArrow = nil;
				}
				_tArrow=[[TailedArrow alloc] initWithControlPoint:nil];
				_tArrow.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_tArrow];
				
			}
			[_tArrow pushPoint:[self.mapView toMapPoint:point]];
			
			_controlPoints++;
		}
			break;
		case pt_customTailedArrow:
		{
		}
			break;
		case pt_straightArrow:
		{
			if (_controlPoints == 0) {
				
				if (_sArrow != nil) {
					[_sArrow release];
					_sArrow = nil;
				}
				_sArrow=[[StraightArrow alloc] initWithControlPoint:nil];
				_sArrow.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_sArrow];
				
			}
			[_sArrow pushPoint:[self.mapView toMapPoint:point]];
						_controlPoints++;
		}
			break;
		case pt_doubleArrow:
		{
			if (_controlPoints == 0) {
				
				if (_dArrow != nil) {
					[_dArrow release];
					_dArrow = nil;
				}
				_dArrow=[[DoubleArrow alloc] initWithControlPoint:nil];
				_dArrow.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_dArrow];
				
			}
			[_dArrow pushPoint:[self.mapView toMapPoint:point]];
			
			_controlPoints++;
		}
			break;
		case pt_assemblyArea:
		{
			if (_controlPoints == 0) {
				
				if (_assemblyArea != nil) {
					[_assemblyArea release];
					_assemblyArea = nil;
				}
				_assemblyArea=[[AssemblyArea alloc] initWithControlPoint:nil];
				_assemblyArea.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_assemblyArea];				
			}
			[_assemblyArea pushPoint:[self.mapView toMapPoint:point]];
			
			_controlPoints++;
		
		}
			break;
		case pt_circle :
		{
			if (_controlPoints == 0) 
			{
				
				if (_circle != nil) {
					[_circle release];
					_circle = nil;
				}
				_circle=[[Circle alloc] initWithControlPoint:nil];
				_circle.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_circle];				
			}
			[_circle pushPoint:[self.mapView toMapPoint:point]];
			
			_controlPoints++;
		}
			break;
		case pt_triangleFlag:
		{
			if (_controlPoints == 0) {
				
				if (_triangleFlag != nil) {
					[_triangleFlag release];
					_triangleFlag = nil;
				}
				_triangleFlag=[[TriangleFlag alloc] initWithControlPoint:nil];
				_triangleFlag.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_triangleFlag];
				
			}
			[_triangleFlag pushPoint:[self.mapView toMapPoint:point]];
			
			_controlPoints++;
			
		}
			break;
		case pt_rectFlag:
		{
			if (_controlPoints == 0) {
				
				if (_rectFlag != nil) {
					[_rectFlag release];
					_rectFlag = nil;
				}
				_rectFlag=[[RectFlag alloc] initWithControlPoint:nil];
				_rectFlag.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_rectFlag];
				
			}
			[_rectFlag pushPoint:[self.mapView toMapPoint:point]];
						_controlPoints++;
			
		}
			break;
		case pt_curveFlag:
		{
			if (_controlPoints == 0) {
				
				if (_curveFlag != nil) {
					[_curveFlag release];
					_curveFlag = nil;
				}
				_curveFlag=[[CurveFlag alloc] initWithControlPoint:nil];
				_curveFlag.spatialReference = self.mapView.spatialReference;
				//	[_cArrow retain];
				[self createPlotGeometry:_curveFlag];
				
			}
			[_curveFlag pushPoint:[self.mapView toMapPoint:point]];
			
			_controlPoints++;
		}
			break;
		
		default:
			break;
	}
//	NSLog(@"began:x=%lf,y=%lf",point.x,point.y);

	
}
- (void)mapTouchesEnd:(CGPoint) point
{
    
	switch (_plotType) {
		case pt_simpleArrow:
		{
			if (_controlPoints >1) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_arrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_arrow];
			}
		}
			break;
		case pt_customArrow:
		{
		}
			break;
		case pt_tailedArrow:
		{
			if (_controlPoints >1) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_tArrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                
                [self createPlotGeometry:_tArrow];
								
			}
		}
			break;
		case pt_customTailedArrow:
		{
		}
			break;
		case pt_straightArrow:
		{
			if (_controlPoints >1) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_sArrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
				[self createPlotGeometry:_sArrow];
				
			}
		}
			break;
		case pt_doubleArrow:
		{
			if (_controlPoints >1 && _controlPoints<5) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_dArrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
				[self createPlotGeometry:_dArrow];
			}
		}
			break;
		case pt_assemblyArea:
		{
			if (_controlPoints >1 && _controlPoints<3) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_assemblyArea updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_assemblyArea];
							}
		}
			break;
		case pt_circle :
		{
			if (_controlPoints >1 && _controlPoints<3) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_circle updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_circle];
							}
		}
			break;
		case pt_triangleFlag:
		{
			if (_controlPoints >1 && _controlPoints<3) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_triangleFlag updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_triangleFlag];
							}
		}
			break;
		case pt_rectFlag:
		{
			if (_controlPoints >1 && _controlPoints<3) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_rectFlag updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_rectFlag];
				
			}
		}
			break;
		case pt_curveFlag:
		{
			if (_controlPoints >1 && _controlPoints<3) {
			//	NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_curveFlag updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_curveFlag];
				
			}
		}
			break;
			
		default:
			break;
	}

	

}
- (void)mapTouchesMoved:(CGPoint) point
{
	/*
	switch (_plotType) {
		case pt_simpleArrow:
		{
			if (_controlPoints >1) {
				NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_arrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
				[self createPlotGeometry:_arrow];
			}
		}
			break;
		case pt_customArrow:
		{
		}
			break;
		case pt_tailedArrow:
		{
			if (_controlPoints >1) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_tArrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_tArrow];
				
			}
		}
			break;
		case pt_customTailedArrow:
		{
		}
			break;
		case pt_straightArrow:
		{
			if (_controlPoints >1) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_sArrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_sArrow];
				
			}
		}
			break;
		case pt_doubleArrow:
		{
			if (_controlPoints >1 && _controlPoints<5) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_dArrow updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_dArrow];
							}
		}
			break;
		case pt_assemblyArea:
		{
			if (_controlPoints >1 && _controlPoints<3) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_assemblyArea updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_assemblyArea];
				
			}
		}
			break;
		case pt_circle :
		{
			if (_controlPoints >1 && _controlPoints<3) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_circle updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_circle];
				
			}
		}
			break;
		case pt_triangleFlag:
		{
			if (_controlPoints >1 && _controlPoints<3) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_triangleFlag updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_triangleFlag];
				
			}
		}
			break;
		case pt_rectFlag:
		{
			if (_controlPoints >1 && _controlPoints<3) {
				//NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_rectFlag updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_rectFlag];
				
			}
		}
			break;
		case pt_curveFlag:
		{
			if (_controlPoints >1 && _controlPoints<3) {
				NSLog(@"End:x=%lf,y=%lf",point.x,point.y);
				[_curveFlag updateControlPoint:[self.mapView toMapPoint:point]  withIndex:_controlPoints-1];
                [self createPlotGeometry:_curveFlag];
				
			}
		}
			break;
			
		default:
			break;
	}
	NSLog(@"move:x=%lf,y=%lf",point.x,point.y);

	
	if (_numberOfPoints == 0) {
		AGSSimpleFillSymbol *symbol = [AGSSimpleFillSymbol simpleFillSymbol];
		symbol.color = [UIColor redColor];
		symbol.style = AGSSimpleFillSymbolStyleSolid;
		_arrow=[[SimpleArrow alloc] initWithControlPoint:nil];
		_arrow.spatialReference = self.mapView.spatialReference;
		//	[_cArrow retain];
		AGSGraphic * gra = [[AGSGraphic alloc ]initWithGeometry:_arrow
														 symbol:symbol
													 attributes:nil 
										   infoTemplateDelegate:nil];
		[self.graphicsLayer addGraphic:gra];
		[_arrow pushPoint:[self.mapView toMapPoint:point]];
    
		_controlPoints = 1;
		}
	if (_numberOfPoints%30  ==15) {
		_controlPoints++;
		NSLog(@"number1:x=%d",_numberOfPoints);
		[_arrow pushPoint:[self.mapView toMapPoint:point]];
		
	}
	if (_controlPoints >1) {
		[_arrow updateControlPoint:[self.mapView toMapPoint:point] withIndex:_controlPoints-1];
			}
	_numberOfPoints++;
	NSLog(@"number:x=%d",_numberOfPoints);
     
     */
	 
	
	
}
-(void) startDraw
{
	if (!_isAddTouchView) {
		[self.view addSubview:self.touchView ];
		_isAddTouchView = YES;
	}
	_controlPoints = 0;
}
-(void) endDraw
{
	if (_isAddTouchView) {
		[self.touchView removeFromSuperview];
		_isAddTouchView = NO;
	}
	_controlPoints = 0;
}
- (IBAction)Clear:(id)sender {
    
    [self.graphicsLayer removeAllGraphics];
}

-(IBAction) drawSimpleArrow:(id) sender
{
	_plotType = pt_simpleArrow;
	[self endDraw];
	[self startDraw];
	
}
-(IBAction) drawTailedArrow:(id) sender
{
	_plotType = pt_tailedArrow;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawStraightArrow:(id) sender
{
	_plotType = pt_straightArrow;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawDoubleArrow:(id) sender
{
	_plotType = pt_doubleArrow;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawAssemblyArea:(id) sender
{
	_plotType = pt_assemblyArea;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawCircle:(id) sender
{
	_plotType = pt_circle;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawRectFlag:(id) sender
{
	_plotType = pt_rectFlag;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawTriangleFlag:(id) sender
{
	_plotType = pt_triangleFlag;
	[self endDraw];
	[self startDraw];
}

-(IBAction) drawDone:(id) sender
{
	_isFinished = YES;
	_controlPoints = 0;
	[self endDraw];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	_numberOfPoints = 0;
	_isFinished = NO;
	_controlPoints = 0;
    [super viewDidLoad];
	
	/* ##################################################### */
	// TODO
	// Replace the following block of code with your own.
	//
	NSURL *mapUrl = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer"];
	AGSTiledMapServiceLayer *tiledLyr = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:mapUrl];
	[self.mapView addMapLayer:tiledLyr withName:@"Tiled Layer"];
	
	AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:102100];
	AGSEnvelope *env = [AGSEnvelope envelopeWithXmin:-13626513.829723023
												ymin:4549088.827634182
												xmax:-13626131.64458163 
												ymax:4549638.218774935 
									spatialReference:sr];
	[self.mapView zoomToEnvelope:env animated:YES]; 
	self.mapView.layerDelegate = self;
    //self.mapView.touchDelegate = self;
	self.graphicsLayer = [AGSGraphicsLayer graphicsLayer];
    [self.mapView addMapLayer: self.graphicsLayer withName:@"gra Layer"];
	CGRect frame = self.mapView.frame;
	frame.origin.y = frame.origin.y;
	frame.size.height = frame.size.height ;
	self.touchView = [[UITouchView alloc] initWithFrame:frame];
	self.touchView.delegate = self;
    
    
	/* ##################################################### */
}



- (void)mapView:(AGSMapView *)mapView didClickAtPoint:(CGPoint)screen mapPoint:(AGSPoint *)mappoint graphics:(NSDictionary *)graphics
{
	if (_numberOfPoints == 0) {
		_pointArray = [[NSMutableArray alloc] initWithCapacity:0];
	//	[_pointArray addObject:mappoint];
		_numberOfPoints ++;
		AGSSimpleFillSymbol *symbol = [AGSSimpleFillSymbol simpleFillSymbol];
		symbol.color = [UIColor redColor];
		symbol.style = AGSSimpleFillSymbolStyleSolid;
		_dArrow = [[DoubleArrow  alloc] initWithControlPoint:nil];
		_dArrow.spatialReference = self.mapView.spatialReference;
	//	[_cArrow retain];
		AGSGraphic * gra = [[AGSGraphic alloc ]initWithGeometry:_dArrow
														 symbol:symbol
													 attributes:nil 
										   infoTemplateDelegate:nil];
		[self.graphicsLayer addGraphic:gra];
	}
	[_dArrow pushPoint:mappoint];
//	NSLog(@"mapPoint x= %lf;y=%lf",mappoint.x,mappoint.y);
	
}




/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.mapView = nil;
    [super dealloc];
}

@end
