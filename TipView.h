//
//  TipView.h
//  WeChat1
//
//  Created by cecilia on 2022/9/8.
//  Copyright © 2022 Topsky. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 
 @property(nonatomic,strong) TipView *tipView;

 @end

 @implementation HomeTableViewController

 - (TipView *)tipView
 {
     if (!_tipView) {
         _tipView = [[TipView alloc] init];
     }
     return _tipView;
 }

 - (void)viewDidLoad {
     [super viewDidLoad];
     [self.view addSubview:self.tipView];
     
     [_tipView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.view.mas_left).offset(10);
         make.width.mas_equalTo(150);
         make.height.mas_equalTo(30);
         make.top.mas_equalTo(self.view.mas_top).offset(100);
     }];        
 */
@protocol TipViewDelegate <NSObject>
@optional
-(void)singleTriangleClick;

@end

@interface TipView : UIView
@property(nonatomic, weak)   id <TipViewDelegate> myDelegate;
@end

