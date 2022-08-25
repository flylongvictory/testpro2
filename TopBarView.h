//
//  TopBarView.h
//  TestRouter
//
//  Created by cecilia on 2022/8/25.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"

@protocol QSTopBarViewDelegate <NSObject>
@optional
-(void)singleTriangleClick;

@end

@interface TopBarView : UIView

@property(nonatomic, strong) TopModel *topModel;
@property(nonatomic, weak)   id <QSTopBarViewDelegate> myDelegate;

@end

