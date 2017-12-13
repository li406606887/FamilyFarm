//
//  OrderView.m
//  FamilyFarm
//
//  Created by user on 2017/10/27.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "OrderView.h"
#import "OrderViewModel.h"
#import "OrderTableViewCell.h"
#import "SegmentedScrollView.h"

@interface OrderView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) SegmentedScrollView *segmentedView;
@property(nonatomic,strong) OrderViewModel *viewModel;
@end

@implementation OrderView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self.viewModel = (OrderViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.segmentedView];
    [self addSubview:self.table];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];

}

-(void)updateConstraints {
    [super updateConstraints];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(40, 0, 0, 0));
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([OrderTableViewCell class])] forIndexPath:indexPath];
    
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
        _table.dataSource = self;
        _table.delegate = self;
        [_table registerClass:[OrderTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([OrderTableViewCell class])]];
    }
    return _table;
}

-(SegmentedScrollView *)segmentedView {
    if (!_segmentedView) {
        _segmentedView = [[SegmentedScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) item:[NSArray arrayWithObjects:@"商城订单",@"商家订单",@"课堂订单", nil]];
        _segmentedView.defultTitleColor = [UIColor blackColor];
        _segmentedView.selectedTitleColor = [UIColor blueColor];
        [_segmentedView show];
    }
    return _segmentedView;
}
@end
