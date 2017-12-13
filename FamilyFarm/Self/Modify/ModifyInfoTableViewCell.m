//
//  ModifyInfoTableViewCell.m
//  FamilyFarm
//
//  Created by user on 2017/10/26.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "ModifyInfoTableViewCell.h"

@interface ModifyInfoTableViewCell()
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *contentLabel;
@end

@implementation ModifyInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(150, 30));
    }];
}

-(void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

-(void)setContent:(NSString *)content {
    self.contentLabel.text = content;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentRight;
    }
    return _contentLabel;
}
@end
