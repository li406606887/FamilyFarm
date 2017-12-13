//
//  FriendsCircleView.m
//  FamilyFarm
//
//  Created by user on 2017/10/25.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FriendsCircleView.h"
#import "SegmentedScrollView.h"
#import "FriendsCircleViewModel.h"
#import "FriendsCircleTableViewCell.h"

@interface FriendsCircleView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) FriendsCircleViewModel *viewModel;
@property(nonatomic,strong) SegmentedScrollView *segmentedView;
@property(nonatomic,strong) UITableView *table;
@end

@implementation FriendsCircleView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FriendsCircleViewModel *)viewModel;
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendsCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([FriendsCircleTableViewCell class])] forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel.friendsCircleCellClickSubject sendNext:[NSString stringWithFormat:@"%ld",indexPath.row]];
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
        _table.dataSource = self;
        _table.delegate = self;
        _table.tableHeaderView = self.segmentedView;
        [_table registerClass:[FriendsCircleTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([FriendsCircleTableViewCell class])]];
    }
    return _table;
}
-(SegmentedScrollView *)segmentedView {
    if (!_segmentedView) {
        _segmentedView = [[SegmentedScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35) item:[NSArray arrayWithObjects:@"校友",@"全世界", nil]];
        _segmentedView.defultTitleColor = [UIColor blackColor];
        _segmentedView.selectedTitleColor = [UIColor blueColor];
        _segmentedView.backgroundColor = [UIColor lightGrayColor];
        _segmentedView.lineColor = [UIColor redColor];
        [_segmentedView show];
    }
    return _segmentedView;
}
@end
