//
//  MineGroupTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/30.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "MineGroupTableViewCell.h"

@interface MineGroupTableViewCell ()
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *content;
@property(nonatomic,strong) UILabel *time;
@property(nonatomic,strong) UIImageView *imageDetails;

@end

@implementation MineGroupTableViewCell

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
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.content];
    [self.contentView addSubview:self.time];
    [self.contentView addSubview:self.imageDetails];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(80, 80));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.top.equalTo(self.icon).with.offset(-3);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-180, 20));
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.icon);
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-180, 20));
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.icon.mas_bottom).with.offset(3);
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-180, 20));
    }];
    
    [self.imageDetails  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.size.mas_offset(CGSizeMake(80, 80));
    }];
}

-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor yellowColor];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 40;
    }
    return _icon;
}

-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        _title.text = @"哈哈哈";
    }
    return _title;
}

-(UILabel *)content {
    if (!_content) {
        _content = [[UILabel alloc] init];
        _content.text = @"就是怪我怪我怪我咯";
    }
    return _content;
}

-(UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] init];
        _time.text = @"17-09-10 12:02:11";
        _time.font = [UIFont systemFontOfSize:14];
    }
    return _time;
}

-(UIImageView *)imageDetails {
    if (!_imageDetails) {
        _imageDetails = [[UIImageView alloc] init];
        _imageDetails.backgroundColor = [UIColor greenColor];
    }
    return _imageDetails;
}

@end
