//
//  FarmView.m
//  FamilyFarm
//
//  Created by user on 2017/10/18.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FarmView.h"
#import "FarmViewModel.h"
#import "FarmHeadView.h"
#import "FarmTableViewCell.h"
#import "SegmentedControlView.h"
#import "RankingView.h"

@interface FarmView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) FarmHeadView *headView;
@property(nonatomic,strong) FarmViewModel *viewModel;
@end

@implementation FarmView
#pragma mark 初始化绑定viewModel
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FarmViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.table];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
#pragma mark tableView 代理事件


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    sectionView.backgroundColor = [UIColor brownColor];
    RankingView *ranking = [[RankingView alloc] initWithViewModel:self.viewModel];
    [sectionView addSubview:ranking];
    [ranking mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(sectionView);
        make.top.equalTo(sectionView);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 40));
    }];
    SegmentedControlView *segmented = [[SegmentedControlView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.5-100,50, 200, 40) item:[NSArray arrayWithObjects:@"世界排名",@"校园排名", nil]];
    segmented.itemClick = ^(int index) {
        NSLog(@"%d",index);
    };
    [sectionView addSubview:segmented];
    return sectionView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FarmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([FarmTableViewCell class])] forIndexPath:indexPath];
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[FarmTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([FarmTableViewCell class])]];
        UIView *headCon = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH+100)];
        _table.tableHeaderView = headCon;
        [headCon addSubview:self.headView];
        [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(headCon);
        }];
    }
    return _table;
}
-(FarmHeadView *)headView {
    if (!_headView) {
        _headView = [[FarmHeadView alloc] initWithViewModel:self.viewModel];
        _headView.backgroundColor = [UIColor purpleColor];
    }
    return _headView;
}
@end
