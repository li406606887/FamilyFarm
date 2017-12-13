//
//  CourseViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/18.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "CourseViewController.h"
#import "CourseDetailsViewController.h"
#import "CourseViewModel.h"
#import "CourseView.h"

@interface CourseViewController ()
@property(nonatomic,strong) CourseView * mainView;
@property(nonatomic,strong) CourseViewModel *viewModel;
@end

@implementation CourseViewController

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
    [[self.viewModel.courseCellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        CourseDetailsViewController *courseDetails = [[CourseDetailsViewController alloc] init];
        [self.navigationController pushViewController:courseDetails animated:YES];
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
-(CourseViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[CourseViewModel alloc] init];
    }
    return _viewModel;
}

-(CourseView *)mainView {
    if (!_mainView) {
        _mainView = [[CourseView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}
@end
