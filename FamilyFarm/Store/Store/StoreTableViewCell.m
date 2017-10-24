//
//  StoreTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/23.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "StoreTableViewCell.h"

@interface StoreTableViewCell ()
@property(nonatomic,strong) UIImageView *imageDetails;
@property(nonatomic,strong) UILabel *price;
@property(nonatomic,strong) UILabel *title;
@end

@implementation StoreTableViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageDetails];
        [self addSubview:self.price];
        [self addSubview:self.title];
        
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.imageDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH*0.5-10, SCREEN_WIDTH*0.5-10));
    }];
    
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.imageDetails.mas_bottom).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH*0.5-15, 20));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.price.mas_bottom).with.offset(6);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH*0.5-35, 20));
    }];
}

-(UIImageView *)imageDetails {
    if (!_imageDetails) {
        _imageDetails = [[UIImageView alloc] init];
        _imageDetails.backgroundColor = [UIColor greenColor];
    }
    return _imageDetails;
}

-(UILabel *)price {
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.font = [UIFont systemFontOfSize:14];
        _price.text = @"112";
    }
    return _price;
}

-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        _title.text = @"hhhh";
    }
    return _title;
}
@end
