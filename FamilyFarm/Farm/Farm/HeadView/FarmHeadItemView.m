//
//  FarmHeadItemView.m
//  FamilyFarm
//
//  Created by user on 2017/10/19.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FarmHeadItemView.h"
#import "FarmViewModel.h"


@interface FarmHeadItemView()
@property(nonatomic,strong) FarmViewModel *viewModel;
@end

@implementation FarmHeadItemView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FarmViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addItemView];
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
-(void)addItemView{
    CGFloat kWidth = SCREEN_WIDTH/4;
    
    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"种植",@"圈子",@"游戏",@"商城", nil];
    
    for (int i = 0 ; i < 4;i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        [item setTitle:titleArray[i] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:@"ss"] forState:UIControlStateNormal];
        @weakify(self)
        [[item rac_signalForControlEvents:UIControlEventTouchUpInside]
           subscribeNext:^(__kindof UIControl * _Nullable x) {
           @strongify(self)
            [self.viewModel.farmHeadItemClickSubject sendNext:[NSString stringWithFormat:@"%ld",x.tag]];
        }];
        [item setTag:i];
        [self addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).with.offset(i*kWidth);
            make.size.mas_offset(CGSizeMake(kWidth, kWidth));
        }];
    }
    
    
}

@end
