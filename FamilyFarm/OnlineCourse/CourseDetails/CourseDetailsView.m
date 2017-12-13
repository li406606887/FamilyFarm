//
//  CourseDetailsView.m
//  FamilyFarm
//
//  Created by user on 2017/11/2.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "CourseDetailsView.h"
#import "CourseDetailsHeadView.h"
#import "CourseDetailsViewModel.h"

@interface CourseDetailsView ()
@property(nonatomic,strong) CourseDetailsHeadView *headView;
@property(nonatomic,strong) CourseDetailsViewModel *viewModel;
@end

@implementation CourseDetailsView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (CourseDetailsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.headView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.75+100));
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(CourseDetailsHeadView *)headView {
    if (!_headView) {
        _headView = [[CourseDetailsHeadView alloc] init];
    }
    return _headView;
}
@end
