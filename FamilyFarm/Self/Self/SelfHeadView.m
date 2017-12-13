//
//  SelfHeadView.m
//  FamilyFarm
//
//  Created by user on 2017/10/24.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "SelfHeadView.h"
#import "SelfViewModel.h"

@interface SelfHeadView ()
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *details;
@property(nonatomic,strong) UIButton *modifyBtn;
@property(nonatomic,strong) UIButton *signBtn;
@property(nonatomic,strong) SelfViewModel *viewModel;
@end

@implementation SelfHeadView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (SelfViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.details];
    [self addSubview:self.modifyBtn];
    [self addSubview:self.signBtn];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(15);
        make.size.mas_offset(CGSizeMake(80, 80));
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon).with.offset(5);
        make.left.equalTo(self.icon.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.details mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name.mas_bottom).with.offset(6);
        make.left.equalTo(self.icon.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-130, 40));
    }];
    
    [self.modifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon).with.offset(-5);
        make.left.equalTo(self.name.mas_right).with.offset(-10);
        make.size.mas_offset(CGSizeMake(60, 30));
    }];
    
    [self.signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon).with.offset(-5);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.size.mas_offset(CGSizeMake(60, 30));
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [_icon setBackgroundColor:[UIColor greenColor]];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 40;
    }
    return _icon;
}

-(UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:13];
        _name.text = @"";
    }
    return _name;
}

-(UILabel *)details {
    if (!_details) {
        _details = [[UILabel alloc] init];
        _details.font = [UIFont systemFontOfSize:13];
        [_details setText:@"有一个好消息和一个坏消息，坏消息是，我们迷路了以后只能吃牛粪过日子了，好消息是牛粪有的是"];
        _details.numberOfLines = 0;
    }
    return _details;
}

-(UIButton *)modifyBtn {
    if (!_modifyBtn) {
        _modifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_modifyBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_modifyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_modifyBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_modifyBtn setBackgroundColor:[UIColor orangeColor]];
        @weakify(self)
        [[_modifyBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            [self.viewModel.modifyInfoClickSubject sendNext:nil];
        }];
    }
    return _modifyBtn;
}
-(UIButton *)signBtn {
    if (!_signBtn) {
        _signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signBtn setTitle:@"签到" forState:UIControlStateNormal];
        [_signBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_signBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_signBtn setBackgroundColor:[UIColor orangeColor]];
        [[_signBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        }];
    }
    return _signBtn;
}
@end
