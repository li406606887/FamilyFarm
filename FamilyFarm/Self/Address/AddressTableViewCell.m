//
//  AddressTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/26.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "AddressTableViewCell.h"

@interface AddressTableViewCell ()
@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *address;
@property(nonatomic,strong) UILabel *phoneNum;
@property(nonatomic,strong) UIButton *delete;
@property(nonatomic,strong) UIButton *modify;
@end

@implementation AddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupViews {
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.address];
    [self.contentView addSubview:self.phoneNum];
    [self.contentView addSubview:self.delete];
    [self.contentView addSubview:self.modify];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.equalTo(self.name.mas_bottom).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-30, 40));
    }];
    
    [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.top.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.delete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        make.size.mas_offset(CGSizeMake(40, 30));
    }];
    [self.modify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.delete.mas_left).with.offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        make.size.mas_offset(CGSizeMake(40, 30));
    }];
}

-(UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:14];
        _name.text = @"哈哈哈哈哈哈";
    }
    return _name;
}

-(UILabel *)address {
    if (!_address) {
        _address = [[UILabel alloc] init];
        _address.numberOfLines = 2;
        _address.font = [UIFont systemFontOfSize:14];
        _address.text = @"hakjshdkahsdhaskjdhkajsh";
    }
    return _address;
}

-(UILabel *)phoneNum {
    if (!_phoneNum) {
        _phoneNum = [[UILabel alloc] init];
        _phoneNum.text = @"123123123";
        _phoneNum.font = [UIFont systemFontOfSize:14];
    }
    return _phoneNum;
}

-(UIButton *)delete {
    if (!_delete) {
        _delete = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delete.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_delete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_delete setTitle:@"删除" forState:UIControlStateNormal];
    }
    return _delete;
}

-(UIButton *)modify {
    if (!_modify) {
        _modify = [UIButton buttonWithType:UIButtonTypeCustom];
        [_modify.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_modify setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_modify setTitle:@"编辑" forState:UIControlStateNormal];
    }
    return _modify;
}
@end
