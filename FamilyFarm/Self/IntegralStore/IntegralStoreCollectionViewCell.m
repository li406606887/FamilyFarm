//
//  IntegralStoreCollectionViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/28.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "IntegralStoreCollectionViewCell.h"

@interface IntegralStoreCollectionViewCell ()
@property(nonatomic,strong) UIImageView *imageDetails;
@property(nonatomic,strong) UILabel *price;
@property(nonatomic,strong) UIButton *buy;
@end

@implementation IntegralStoreCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageDetails];
        [self addSubview:self.price];
        [self addSubview:self.buy];
        
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
    
    [self.buy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self.imageDetails.mas_bottom).with.offset(10);
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

-(UILabel *)price {
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.font = [UIFont systemFontOfSize:14];
        _price.text = @"112";
    }
    return _price;
}

-(UIButton *)buy {
    if (!_buy) {
        _buy = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buy.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_buy setBackgroundColor:[UIColor orangeColor]];
        [_buy setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buy setTitle:@"兑换" forState:UIControlStateNormal];
    }
    return _buy;
}
@end

