//
//  CourseDetailsHeadView.m
//  FamilyFarm
//
//  Created by user on 2017/11/2.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "CourseDetailsHeadView.h"
#import "CourseDetailsViewModel.h"
#import "LZPlayerView.h"

@interface CourseDetailsHeadView()<LZAVPlayerDelegate>
@property(nonatomic,strong) CourseDetailsViewModel *viewModel;
@property(nonatomic,strong) LZPlayerView *playerView;//播放器View
@end

@implementation CourseDetailsHeadView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (CourseDetailsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.playerView];
    [self addSubview:self.title];
    [self addSubview:self.longTime];
    [self addSubview:self.playBtn];
    [self addSubview:self.loadProgress];
    [self addSubview:self.slider];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];

    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.75));
    }];
    [self.loadProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.playerView.mas_bottom);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 20));
    }];
    
    [self.longTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playerView.mas_bottom).with.offset(10);
        make.centerX.equalTo(self);
        make.size.mas_offset(CGSizeMake(100, 20));
    }];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.playerView.mas_bottom);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 20));
        
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playerView.mas_bottom).with.offset(50);
        make.centerX.equalTo(self);
        make.size.mas_offset(CGSizeMake(80 ,40));
    }];
}

// LZAVPlayer delegate  ----- 状态提示
- (void)promptPlayerStatusOrErrorWith:(LZAVPlayerStatus)status
{
    switch (status) {
        case LZAVPlayerStatusLoadingVideo:// 开始准备
//            [self.activity startAnimating];
            break;
        case LZAVPlayerStatusReadyToPlay:// 准备完成
//            [self.activity stopAnimating];
//            [self.playOrPause setTitle:@"暂停" forState:UIControlStateNormal];
            self.slider.maximumValue = self.playerView.totalTime;
            self.slider.value = 0;
            self.loadProgress.progress = 0;
            break;
        default:
            break;
    }
}

// LZAVPlayer delegate  ----- 刷新数据
- (void)refreshDataWith:(NSTimeInterval)totalTime Progress:(NSTimeInterval)currentTime LoadRange:(NSTimeInterval)loadTime
{
    [self.loadProgress setProgress:(loadTime/totalTime) animated:YES];

    [self.slider setValue:currentTime animated:YES];

    self.longTime.text = [NSString stringWithFormat:@"%@/%@",[self otherConvertTimeFormat:currentTime],[self otherConvertTimeFormat:totalTime]];
}

- (NSString *)otherConvertTimeFormat:(NSInteger)time
{
    NSString *needStr = @"";
    
    if (time < 3600) {
        
        needStr =  [NSString stringWithFormat:@"%02li:%02li",lround(floor(time/60.f)),lround(floor(time/1.f))%60];
        
    } else {
        
        needStr =  [NSString stringWithFormat:@"%02li:%02li:%02li",lround(floor(time/3600.f)),lround(floor(time%3600)/60.f),lround(floor(time/1.f))%60];
        
    }
    return needStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(LZPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[LZPlayerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.75)];
        _playerView.delegate = self;
        _playerView.backgroundColor = [UIColor clearColor];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"qihuo_03" withExtension:nil];
        [_playerView setupPlayerWith:url];
    }
    return _playerView;
}



-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        _title.backgroundColor = [UIColor orangeColor];
    }
    return _title;
}

-(UILabel *)longTime {
    if (!_longTime) {
        _longTime = [[UILabel alloc] init];
        _longTime.font = [UIFont systemFontOfSize:13];
        _longTime.text = @"00.00";
    }
    return _longTime;
}

-(UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setBackgroundColor:[UIColor greenColor]];
        @weakify(self)
        [[_playBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            [self.playerView playOrPause:^(BOOL isPlay) {
                isPlay = !isPlay;
            }];
        }];
    }
    return _playBtn;
}

-(UIProgressView *)loadProgress {
    if (!_loadProgress) {
        _loadProgress = [[UIProgressView alloc] init];
    }
    return _loadProgress;
}

-(UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc] init];
        _slider.minimumTrackTintColor = [UIColor redColor];
        _slider.maximumTrackTintColor = [UIColor greenColor];
    }
    return _slider;
}
@end
