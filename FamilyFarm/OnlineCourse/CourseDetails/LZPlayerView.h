//
//  LZPlayerView.h
//  FamilyFarm
//
//  Created by user on 2017/11/3.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSInteger, LZAVPlayerStatus) {
    LZAVPlayerStatusReadyToPlay = 0, // 准备好播放
    LZAVPlayerStatusLoadingVideo,    // 加载视频
    LZAVPlayerStatusPlayEnd,         // 播放结束
    LZAVPlayerStatusCacheData,       // 缓冲视频
    LZAVPlayerStatusCacheEnd,        // 缓冲结束
    LZAVPlayerStatusPlayStop,        // 播放中断 （多是没网）
    LZAVPlayerStatusItemFailed,      // 视频资源问题
    LZAVPlayerStatusEnterBack,       // 进入后台
    LZAVPlayerStatusBecomeActive,    // 从后台返回
};

@protocol LZAVPlayerDelegate <NSObject>

@optional
// 数据刷新
- (void)refreshDataWith:(NSTimeInterval)totalTime Progress:(NSTimeInterval)currentTime LoadRange:(NSTimeInterval)loadTime;
// 状态/错误 提示
- (void)promptPlayerStatusOrErrorWith:(LZAVPlayerStatus)status;

@end

@interface LZPlayerView : UIView

@property (nonatomic, weak) id<LZAVPlayerDelegate>delegate;


// 视频总长度
@property (nonatomic, assign) NSTimeInterval totalTime;
// 视频总长度
//@property (nonatomic, assign) NSTimeInterval currentTime;
// 缓存数据
@property (nonatomic, assign) NSTimeInterval loadRange;


/**
 准备播放器
 
 @param videoPath 视频地址
 */
//- (void)setupPlayerWith:(NSString *)videoPath;
- (void)setupPlayerWith:(NSURL *)videoURL;

/** 播放 */
- (void)play;

/** 暂停 */
- (void)pause;

/** 播放|暂停 */
- (void)playOrPause:(void (^)(BOOL isPlay))block;

/** 拖动视频进度 */
- (void)seekPlayerTimeTo:(NSTimeInterval)time;

/** 跳动中不监听 */
- (void)startToSeek;

/**
 切换视频
 
 @param videoPath 视频地址
 */
//- (void)replacePalyerItem:(NSString *)videoPath;
- (void)replacePalyerItem:(NSURL *)videoURL;


@end
