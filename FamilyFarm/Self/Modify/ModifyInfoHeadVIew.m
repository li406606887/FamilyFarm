//
//  ModifyInfoHeadVIew.m
//  FamilyFarm
//
//  Created by user on 2017/10/26.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "ModifyInfoHeadVIew.h"
#import "ModifyInfoViewModel.h"

@interface ModifyInfoHeadVIew ()
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UIImageView *headIcon;
@property(nonatomic,strong) ModifyInfoViewModel *viewModel;
@end

@implementation ModifyInfoHeadVIew
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (ModifyInfoViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.title];
    [self addSubview:self.headIcon];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-20);
        make.centerY.equalTo(self);
        make.size.mas_offset(CGSizeMake(50, 50));
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
        _title.font = [UIFont systemFontOfSize:14];
        _title.text = @"头像";
    }
    return _title;
}

-(UIImageView *)headIcon {
    if (!_headIcon) {
        _headIcon = [[UIImageView alloc] init];
        _headIcon.layer.masksToBounds = YES;
        _headIcon.layer.cornerRadius = 25;
        _headIcon.backgroundColor = [UIColor greenColor];
    }
    return _headIcon;
}
@end
