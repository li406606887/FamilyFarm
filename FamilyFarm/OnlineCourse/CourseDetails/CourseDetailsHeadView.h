//
//  CourseDetailsHeadView.h
//  FamilyFarm
//
//  Created by user on 2017/11/2.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "BaseView.h"
#import <AVFoundation/AVFoundation.h>

@interface CourseDetailsHeadView : BaseView

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UILabel *longTime;

@property(nonatomic,strong) UIButton *playBtn;

@property(nonatomic,strong) UISlider *slider;

@property(nonatomic,strong) UIProgressView *loadProgress;

@end
