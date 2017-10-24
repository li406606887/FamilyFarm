//
//  CourseView.m
//  FamilyFarm
//
//  Created by user on 2017/10/23.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "CourseView.h"
#import "CourseViewModel.h"
#import "CourseTableViewCell.h"
#import "SeachView.h"

@interface CourseView ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>
@property(nonatomic,strong) SeachView *searchBar;
@property(nonatomic,strong) CourseViewModel *viewModel;
@property(nonatomic,strong) UITextField *textfield;
@property(nonatomic,strong) UITableView *table;
@end

@implementation CourseView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self.viewModel = (CourseViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews {
    [self addSubview:self.table];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
//    [self addSubview:self.searchBar];
}

-(void)updateConstraints {
    [super updateConstraints];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_WIDTH*0.5+50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([CourseTableViewCell class])] forIndexPath:indexPath];
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
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
        headView.backgroundColor = [UIColor purpleColor];
        [headView addSubview:self.searchBar];
        [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(headView);
        }];
        _table.tableHeaderView = headView;
        [_table registerClass:[CourseTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([CourseTableViewCell class])]];
    }
    return _table;
}

-(SeachView *)searchBar {
    if (!_searchBar) {
        _searchBar = [[SeachView alloc] initWithViewModel:self.viewModel];
        _searchBar.backgroundColor = [UIColor lightGrayColor];
    }
    return _searchBar;
}

-(UITextField *)textfield {
    if (!_textfield) {
        _textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    }
    return _textfield;
}
@end
