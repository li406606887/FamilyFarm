//
//  CourseTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/23.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "CourseTableViewCell.h"

@interface CourseTableViewCell ()
@property(nonatomic,strong) UIImageView *imageDetails;
@property(nonatomic,strong) UIImageView *priceBack;
@property(nonatomic,strong) UILabel *price;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *time;
@end

@implementation CourseTableViewCell

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
    [self.contentView addSubview:self.priceBack];
    [self.contentView addSubview:self.price];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.time];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.imageDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.5));
    }];
    
    [self.priceBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.imageDetails.mas_bottom);
        make.size.mas_offset(CGSizeMake(60, 60));
    }];
    
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-4);
        make.bottom.equalTo(self.imageDetails.mas_bottom).with.offset(-5);
        make.size.mas_offset(CGSizeMake(60, 20));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-4);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-100, 30));

    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-5);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-4);
        make.size.mas_offset(CGSizeMake(80, 30));
    }];
}

-(UIImageView *)imageDetails {
    if (!_imageDetails) {
        _imageDetails = [[UIImageView alloc] init];
        _imageDetails.backgroundColor = [UIColor greenColor];
    }
    return _imageDetails;
}

-(UIImageView *)priceBack {
    if (!_priceBack) {
        _priceBack = [[UIImageView alloc]init];
        _priceBack.backgroundColor = [UIColor purpleColor];
    }
    return _priceBack;
}

-(UILabel *)price {
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.font = [UIFont systemFontOfSize:14];
        _price.textColor = [UIColor whiteColor];
        _price.text = @"￥11";
        _price.textAlignment = NSTextAlignmentRight;
    }
    return _price;
}

-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        _title.text = @"小葵花妈妈课堂开课啦";
    }
    return _title;
}

-(UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:14];
        _time.text = @"17-08-09";
    }
    return _time;
}
@end
