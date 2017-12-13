//
//  OrderTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/27.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell ()
@property(nonatomic,strong) UIImageView *imageDetails;
@property(nonatomic,strong) UILabel *goodName;
@property(nonatomic,strong) UILabel *phoneNum;
@property(nonatomic,strong) UILabel *time;
@property(nonatomic,strong) UILabel *price;
@property(nonatomic,strong) UILabel *count;
@end

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupViews {
    [self.contentView addSubview:self.imageDetails];
    [self.contentView addSubview:self.goodName];
    [self.contentView addSubview:self.phoneNum];
    [self.contentView addSubview:self.time];
    [self.contentView addSubview:self.price];
    [self.contentView addSubview:self.count];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.imageDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(80, 80));
    }];
    
    [self.goodName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageDetails.mas_right).with.offset(10);
        make.top.equalTo(self.imageDetails);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    
    [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageDetails.mas_right).with.offset(10);
        make.centerY.equalTo(self.imageDetails);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageDetails.mas_right).with.offset(10);
        make.bottom.equalTo(self.imageDetails.mas_bottom);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(10);
        make.top.equalTo(self.imageDetails);
        make.size.mas_offset(CGSizeMake(60, 20));
    }];
    
    [self.count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageDetails);
        make.right.equalTo(self.contentView.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(60, 20));
    }];
}


-(UIImageView *)imageDetails {
    if (!_imageDetails) {
        _imageDetails = [[UIImageView alloc] init];
        _imageDetails.backgroundColor = [UIColor greenColor];
    }
    return _imageDetails;
}

-(UILabel *)goodName {
    if (!_goodName) {
        _goodName = [[UILabel alloc] init];
        _goodName.font = [UIFont systemFontOfSize:14];
        _goodName.text = @"你那么美";
    }
    return _goodName;
}

-(UILabel *)phoneNum {
    if (!_phoneNum) {
        _phoneNum = [[UILabel alloc] init];
        _phoneNum.text = @"18888888888";
        _phoneNum.font = [UIFont systemFontOfSize:14];
    }
    return _phoneNum;
}

-(UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:14];
        _time.text =@"2020-02-02 02:02:02";
    }
    return _time;
}

-(UILabel *)price {
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.text = @"11";
        _price.font = [UIFont systemFontOfSize:14];
    }
    return _price;
}

-(UILabel *)count {
    if (!_count) {
        _count = [[UILabel alloc] init];
        _count.font = [UIFont systemFontOfSize:14];
        _count.text = @"x1";
    }
    return _count;
}
@end
