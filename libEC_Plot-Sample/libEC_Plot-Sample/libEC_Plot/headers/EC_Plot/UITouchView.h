//
//  UITouchView.h
//  PlotSample
//
//  Created by iphone4 on 11-6-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol TouchViewDelegate
- (void)mapTouchesBegan:(CGPoint) point;
- (void)mapTouchesEnd:(CGPoint) point;
- (void)mapTouchesMoved:(CGPoint) point;
@end

@interface UITouchView : UIView {
	id <TouchViewDelegate> delegate;
	CGPoint pointBegin;
}
@property (nonatomic, assign) id <TouchViewDelegate> delegate;
@end
