//
//  FriendsCircleTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/25.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FriendsCircleTableViewCell.h"

@interface FriendsCircleTableViewCell()
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UIImageView *contentImage;
@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *grade;
@property(nonatomic,strong) UILabel *contentText;
@property(nonatomic,strong) UIButton *praise;
@property(nonatomic,strong) UIButton *comments;
@end

@implementation FriendsCircleTableViewCell

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
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.grade];
    [self.contentView addSubview:self.contentText];
    [self.contentView addSubview:self.contentImage];
    [self.contentView addSubview:self.praise];
    [self.contentView addSubview:self.comments];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon);
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.grade mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name.mas_bottom).with.offset(5);
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.size.mas_offset(CGSizeMake(120, 20));
    }];
    
    [self.contentText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).with.offset(8);
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 30));
    }];
    
    [self.contentImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-50, 90));
        make.left.equalTo(self.icon.mas_right).with.offset(8);
        make.top.equalTo(self.contentText.mas_bottom).with.offset(8);
    }];
    
    [self.comments mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-8);
        make.top.equalTo(self.contentImage.mas_bottom).with.offset(4);
        make.size.mas_offset(CGSizeMake(50, 20));
    }];
    
    [self.praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.comments).with.offset(-8);
        make.top.equalTo(self.contentImage.mas_bottom).with.offset(4);
        make.size.mas_offset(CGSizeMake(50, 20));
    }];
}

-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [_icon setBackgroundColor:[UIColor greenColor]];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 15;
    }
    return _icon;
}

-(UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:14];
        _name.text = @"尼古拉斯.索隆";
    }
    return _name;
}

-(UILabel *)grade {
    if (!_grade) {
        _grade = [[UILabel alloc] init];
        _grade.font = [UIFont systemFontOfSize:13];
        _grade.text = @"草帽海贼船-副船长";
    }
    return _grade;
}

-(UILabel *)contentText {
    if (!_contentText) {
        _contentText = [[UILabel alloc] init];
        _contentText.font = [UIFont systemFontOfSize:14];
        _contentText.text = @"草帽一伙的剑士，使用三把刀战斗的三刀流剑士，极恶的世代之一，也是二年前集结香波地群岛的十一超新星之一。目前悬赏3亿2000万贝利";
        _contentText.numberOfLines = 0;
    }
    return _contentText;
}

-(UIImageView *)contentImage {
    if (!_contentImage) {
        _contentImage = [[UIImageView alloc] init];
        _contentImage.backgroundColor = [UIColor greenColor];
    }
    return _contentImage;
}

-(UIButton *)praise {
    if (!_praise) {
        _praise = [UIButton buttonWithType:UIButtonTypeCustom];
        [_praise.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_praise setTitle:@"11" forState:UIControlStateNormal];
        [_praise setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _praise;
}

-(UIButton *)comments {
    if (!_comments) {
        _comments = [UIButton buttonWithType:UIButtonTypeCustom];
        [_comments.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_comments setTitle:@"11" forState:UIControlStateNormal];
        [_comments setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _comments;
}
@end
