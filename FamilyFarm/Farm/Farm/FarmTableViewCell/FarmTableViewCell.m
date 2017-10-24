//
//  FarmTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/19.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FarmTableViewCell.h"

@interface FarmTableViewCell()
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *userName;
@property(nonatomic,strong) UILabel *completeNumber;
@end

@implementation FarmTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setupViews {
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.completeNumber];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(80, 80));
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.icon.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-110, 30));
    }];
    [self.completeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.size.mas_offset(CGSizeMake(80, 30));
    }];
}

-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [_icon setBackgroundColor:[UIColor greenColor]];
    }
    return _icon;
}

-(UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc] init];
        _userName.text = @"s少时诵诗书所";
    }
    return _userName;
}

-(UILabel *)completeNumber {
    if (!_completeNumber) {
        _completeNumber = [[UILabel alloc] init];
        _completeNumber.text = @"以种植:3棵";
    }
    return _completeNumber;
}

@end
