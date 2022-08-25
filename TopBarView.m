//
//  TopBarView.m
//  TestRouter
//
//  Created by cecilia on 2022/8/25.
//

#import "TopBarView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface TopBarView ()

@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) UILabel *activityTitleLabel;
@property(nonatomic, strong) UILabel *onLineNumLabel;
@property(nonatomic, strong) UIButton *triangleBtn;

@end

@implementation TopBarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
        [self addGesture];
        self.userInteractionEnabled=YES;
    }
    return self;
}

- (void)initView{
    [self addSubview:self.avatarImageView];
    [self addSubview:self.activityTitleLabel];
    [self addSubview:self.onLineNumLabel];
    [self addSubview:self.triangleBtn];

    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(20);
        make.top.equalTo(self).offset(5);
        make.width.and.height.mas_equalTo(60);
    }];
    
    [_activityTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).offset(5);
        make.width.mas_equalTo(86);
        make.height.mas_equalTo(30);
        make.top.equalTo(self).offset(5);
    }];
    
    [_onLineNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).offset(5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.activityTitleLabel.mas_bottom).offset(2);
    }];
    
    [_triangleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.onLineNumLabel.mas_right).offset(5);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.backgroundColor=[UIColor clearColor];
        _avatarImageView.image=[UIImage imageNamed:@"avatar"];
        _avatarImageView.layer.cornerRadius = 30;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UILabel *)activityTitleLabel
{
    if (!_activityTitleLabel) {
        _activityTitleLabel = [[UILabel alloc] init];
        _activityTitleLabel.font=[UIFont systemFontOfSize:16];
        _activityTitleLabel.textAlignment = NSTextAlignmentCenter;
        _activityTitleLabel.textColor=[UIColor blueColor];
    }
    return _activityTitleLabel;
}

- (UILabel *)onLineNumLabel
{
    if (!_onLineNumLabel) {
        _onLineNumLabel = [[UILabel alloc] init];
        _onLineNumLabel.font=[UIFont systemFontOfSize:10];
        _onLineNumLabel.textAlignment = NSTextAlignmentCenter;
        _onLineNumLabel.textColor=[UIColor blueColor];
    }
    return _onLineNumLabel;
}

- (UIButton *)triangleBtn
{
    if (!_triangleBtn) {
        _triangleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_triangleBtn setBackgroundColor:[UIColor redColor]];
        [_triangleBtn addTarget:self action:@selector(clickBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_triangleBtn setImage:[UIImage imageNamed:@"triangle"] forState:UIControlStateNormal];
    }
    return _triangleBtn;
}


- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItemView:)];
    [self addGestureRecognizer:tap];
}

- (void)setTopModel:(TopModel *)topModel{
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:topModel.avatarImage] placeholderImage:[UIImage imageNamed:@""]];
    _activityTitleLabel.text = topModel.activityTitle;
    _onLineNumLabel.text = [NSString stringWithFormat:@"%ld 在线观看",topModel.onLineNum];
}

- (void)clickBtnClick
{
    if ([self.myDelegate respondsToSelector:@selector(singleTriangleClick)]) {
        [self.myDelegate singleTriangleClick];
    }
}

- (void)didItemView:(UITapGestureRecognizer *)tap
{
    if ([self.myDelegate respondsToSelector:@selector(singleTriangleClick)]) {
        [self.myDelegate singleTriangleClick];
    }
    
}

@end
