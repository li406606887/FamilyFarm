//
//  LZPlayerToolBar.m
//  FamilyFarm
//
//  Created by user on 2017/11/7.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "LZPlayerToolBar.h"

@implementation LZPlayerToolBar
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
    }
    return self;
}

-(void)addChildView {
    [self addSubview:self.playerSwitchBtn];
    [self addSubview:self.playerSlider];
    [self addSubview:self.playerTimeLabel];
    [self addSubview:self.playerAllTimeLabel];
    [self addSubview:self.playerFulLScreen];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIButton *)playerSwitchBtn {
    if (!_playerSwitchBtn) {
        _playerSwitchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playerSwitchBtn setImage:@"" forState:UIControlStateNormal];
        [_playerSwitchBtn setImage:@"" forState:UIControlStateSelected];
    }
    return _playerSwitchBtn;
}


@end
