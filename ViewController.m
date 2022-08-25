//
//  ViewController.m
//  TestRouter
//
//  Created by cecilia on 2022/8/16.
//

#import "ViewController.h"
#import "TopBarView.h"
#import "Masonry.h"
#import "TopModel.h"

@interface ViewController ()<QSTopBarViewDelegate>

@property (nonatomic, strong)TopBarView *topBarView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topBarView];
    
    [self.topBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.width.mas_equalTo(self.view.mas_width).offset(-20);
        make.height.mas_equalTo(70);
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
    
    TopModel *topModel = [[TopModel alloc]init];
    topModel.avatarImage = @"https://p4.ssl.qhimg.com//t013b43196002479b1f.png";
    topModel.activityTitle = @"网易云音乐";
    topModel.onLineNum = 66669996;
    self.topBarView.topModel = topModel;
}

- (TopBarView *)topBarView
{
    if (!_topBarView) {
        _topBarView = [[TopBarView alloc] init];
        _topBarView.backgroundColor = [UIColor lightGrayColor];
        _topBarView.myDelegate = self;
    }
    return _topBarView;
}

-(void)singleTriangleClick{
    NSLog(@"singleTriangleClicksingleTriangleClick");
}

@end
