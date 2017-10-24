//
//  SeachView.m
//  FamilyFarm
//
//  Created by user on 2017/10/23.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "SeachView.h"
#import "CourseViewModel.h"

@interface SeachView()
@property(nonatomic,strong) CourseViewModel *viewModel;
@property(nonatomic,strong) UITextField *textField;//文本内容
@property(nonatomic,strong) UIButton *searchBtn;//搜索按钮
@property(nonatomic,strong) UIButton *type;//类型
@property(nonatomic,strong) UIButton *releaseTime;//发布时间
@property(nonatomic,strong) UIButton *hotDegrees;//热度
@end

@implementation SeachView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (CourseViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews {
    [self addSubview:self.textField];
    [self addSubview:self.searchBtn];
    [self addSubview:self.type];
    [self addSubview:self.releaseTime];
    [self addSubview:self.hotDegrees];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-90, 30));
    }];
    
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(60, 30));
    }];
    
    [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.textField.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(60, 30));
    }];
    
    [self.releaseTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.textField.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(60, 30));
    }];
    
    [self.hotDegrees mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self.textField.mas_bottom).with.offset(8);
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
-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 5;
        _textField.placeholder = @"";
    }
    return _textField;
}

-(UIButton *)searchBtn {
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setTitle:[NSString stringWithFormat:@"soso"] forState:UIControlStateNormal];
        [_searchBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    return _searchBtn;
}

-(UIButton *)type {
    if (!_type) {
        _type = [UIButton buttonWithType:UIButtonTypeCustom];
        [_type setTitle:@"类型" forState:UIControlStateNormal];
        [_type setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [_type.titleLabel setFont: [UIFont systemFontOfSize:14]];
    }
    return _type;
}

-(UIButton *)releaseTime {
    if (!_releaseTime) {
        _releaseTime = [UIButton buttonWithType:UIButtonTypeCustom];
        [_releaseTime setTitle:@"发布时间" forState:UIControlStateNormal];
        [_releaseTime setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [_releaseTime.titleLabel setFont: [UIFont systemFontOfSize:14]];
    }
    return _releaseTime;
}

-(UIButton *)hotDegrees {
    if (!_hotDegrees) {
        _hotDegrees = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hotDegrees setTitle:@"热度" forState:UIControlStateNormal];
        [_hotDegrees setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [_hotDegrees.titleLabel setFont: [UIFont systemFontOfSize:14]];
    }
    return _hotDegrees;
}
@end
