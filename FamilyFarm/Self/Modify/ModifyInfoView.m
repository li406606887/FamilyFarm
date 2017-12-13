
//
//  ModifyInfoView.m
//  FamilyFarm
//
//  Created by user on 2017/10/26.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "ModifyInfoView.h"
#import "ModifyInfoViewModel.h"
#import "ModifyInfoHeadVIew.h"
#import "ModifyInfoTableViewCell.h"

@interface ModifyInfoView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) ModifyInfoHeadVIew *headView;
@property(nonatomic,strong) ModifyInfoViewModel *viewModel;
@property(nonatomic,strong) NSArray *titleArray;
@end

@implementation ModifyInfoView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (ModifyInfoViewModel *)viewModel;
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
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ModifyInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([ModifyInfoTableViewCell class])] forIndexPath:indexPath];
    [cell setTitle:self.titleArray[indexPath.row]];
    cell.content = @"收拾收拾";
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
        UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        [tableHeadView addSubview:self.headView];
        [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(tableHeadView);
        }];
        _table.tableHeaderView = tableHeadView;
        [_table registerClass:[ModifyInfoTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([ModifyInfoTableViewCell class])]];
    }
    return _table;
}

-(ModifyInfoHeadVIew *)headView {
    if (!_headView) {
        _headView = [[ModifyInfoHeadVIew alloc] initWithViewModel:self.viewModel];
    }
    return _headView;
}

-(NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [[NSArray alloc] initWithObjects:@"姓名",@"手机号",@"班级", nil];
    }
    return _titleArray;
}
@end
