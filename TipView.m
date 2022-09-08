//
//  TipView.m
//  WeChat1
//
//  Created by cecilia on 2022/9/8.
//  Copyright © 2022 Topsky. All rights reserved.
//

#import "TipView.h"
#import <Masonry.h>

static float imageWidth = 30;
static float space = 5;
static float titleWidth = 100;


@interface TipView ()

@property(nonatomic, strong) UILabel *contentLabel;
@property(nonatomic, strong) UIButton *tipBtn;

@end

@implementation TipView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
//        [self addGesture];
        self.userInteractionEnabled=YES;
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.contentLabel];
    [self addSubview:self.tipBtn];


    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5);
        make.top.equalTo(self.mas_top).offset(2);
        make.width.mas_equalTo(self).offset(-10);
        make.height.mas_equalTo(20);//计算
    }];

    [_tipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5);
        make.top.equalTo(self.mas_top).offset(2);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(30);
//        make.centerY.equalTo(self.mas_centerY);
    }];
    
    
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font=[UIFont systemFontOfSize:10];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor=[UIColor blueColor];
        _contentLabel.hidden = YES;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIButton *)tipBtn
{
    if (!_tipBtn) {
        _tipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tipBtn setBackgroundColor:[UIColor redColor]];
        [_tipBtn setTitle:@"直播公告" forState:UIControlStateNormal];
        [_tipBtn addTarget:self action:@selector(clickBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_tipBtn setImage:[UIImage imageNamed:@"adddeviceblebg"] forState:UIControlStateNormal];
//        [_tipBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, - 10, 0, 30)];
//        [_tipBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, -30)];
//
        
        [_tipBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageWidth+space*0.5)+10, 0, 0)];
//        [_tipBtn setImageEdgeInsets:UIEdgeInsetsMake(0, (titleWidth + space*0.5), 0, -(titleWidth + space*0.5))];
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = buttonRect;
//        [button setTitle:@"title" forState:UIControlStateNormal];
//        [button setImage:buttonImage forState:UIControlStateNormal];
        _tipBtn.imageEdgeInsets = UIEdgeInsetsMake(0.0, 90 + 10.0, 0.0, 10.0);
        _tipBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_tipBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _tipBtn;
}




//- (void)addGesture
//{
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItemView:)];
//    [self addGestureRecognizer:tap];
//}

- (void)clickBtnClick
{
    NSLog(@"clickBtnClick");
    
    if ([self.myDelegate respondsToSelector:@selector(singleTriangleClick)]) {
        [self.myDelegate singleTriangleClick];
    }
    
    _tipBtn.hidden = YES;
    _contentLabel.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        _contentLabel.text = @"多线程概念 线程线程指的是:1个CPU执行的CPU命令列为一条无分叉路径 多线程这种无分叉路径不止一条,存在多条即...";
        CGSize contentSize = [_contentLabel sizeThatFits:CGSizeMake(self.frame.size.width, 500)];

//        CGSize contentSize = [_contentLabel sizeThatFit:CGSizeMake(self.frame.size.width, 500)];
        [_contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(contentSize.height);//计算
        }];
        
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(contentSize.height+15);
        }];
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        _contentLabel.hidden = YES;
        _tipBtn.hidden = NO;
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(30);
        }];
    });
}




//- (void)didItemView:(UITapGestureRecognizer *)tap
//{
//    if ([self.myDelegate respondsToSelector:@selector(singleTriangleClick)]) {
//        [self.myDelegate singleTriangleClick];
//    }
//
//}



@end
