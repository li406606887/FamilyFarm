//
//  RankingView.m
//  FamilyFarm
//
//  Created by user on 2017/10/19.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "RankingView.h"
#import "FarmViewModel.h"

@interface RankingView ()
@property(nonatomic,strong) FarmViewModel *viewModel;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *worldRanking;
@property(nonatomic,strong) UILabel *schoolRanking;
@property(nonatomic,strong) UILabel *completeNumber;
@end

@implementation RankingView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self.viewModel =(FarmViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.title];
    [self addSubview:self.worldRanking];
    [self addSubview:self.schoolRanking];
    [self addSubview:self.completeNumber];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(60, 20));
    }];
    
    [self.worldRanking mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.schoolRanking mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.worldRanking.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.completeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.text = @"我的排名";
        _title.font = [UIFont systemFontOfSize:13];
        _title.backgroundColor = [UIColor orangeColor];
    }
    return _title;
}

-(UILabel *)worldRanking {
    if (!_worldRanking) {
        _worldRanking = [[UILabel alloc] init];
        _worldRanking.text = @"世界排名:10";
        _worldRanking.font = [UIFont systemFontOfSize:13];
    }
    return _worldRanking;
    
}

-(UILabel *)schoolRanking {
    if (!_schoolRanking) {
        _schoolRanking = [[UILabel alloc] init];
        _schoolRanking.text = @"我的排名:3";
        _schoolRanking.font = [UIFont systemFontOfSize:13];
    }
    return _schoolRanking;
}
-(UILabel *)completeNumber {
    if (!_completeNumber) {
        _completeNumber = [[UILabel alloc] init];
        _completeNumber.text = @"已种植:3棵";
        _completeNumber.font = [UIFont systemFontOfSize:13];
    }
    return _completeNumber;
}
@end
