//
//  LZPlayerToolBar.h
//  FamilyFarm
//
//  Created by user on 2017/11/7.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZPlayerToolBar : UIView
@property (nonatomic, strong) UIButton *playerSwitchBtn;//播放开关
@property (nonatomic, strong) UISlider *playerSlider;//进度条
@property (nonatomic, strong) UILabel  *playerTimeLabel;//播放时间
@property (nonatomic, strong) UILabel  *playerAllTimeLabel;//总时长
@property (nonatomic, strong) UIButton *playerFulLScreen;//全屏
@end
