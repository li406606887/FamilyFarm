//
//  FriendsCircleViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/25.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FriendsCircleViewController.h"
#import "FriendsCircleViewModel.h"
#import "FriendsCircleView.h"
#import "FriendsCircleDetailsViewController.h"


@interface FriendsCircleViewController ()
@property(nonatomic,strong) FriendsCircleView * mainView;
@property(nonatomic,strong) FriendsCircleViewModel *viewModel;
@end

@implementation FriendsCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addChildView {
    [self.view addSubview:self.mainView];
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)bindViewModel {
    @weakify(self)
    [[self.viewModel.friendsCircleCellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        FriendsCircleDetailsViewController *details = [[FriendsCircleDetailsViewController alloc] init];
        [self.navigationController pushViewController:details animated:YES];
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(FriendsCircleViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[FriendsCircleViewModel alloc] init];
    }
    return _viewModel;
}

-(FriendsCircleView *)mainView {
    if (!_mainView) {
        _mainView = [[FriendsCircleView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}
@end
