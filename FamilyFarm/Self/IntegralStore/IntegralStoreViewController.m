//
//  IntegralStoreViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/27.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "IntegralStoreViewController.h"
#import "IntegralStoreView.h"
#import "IntegralStoreViewModel.h"

@interface IntegralStoreViewController ()
@property(nonatomic,strong) IntegralStoreView *mainView;
@property(nonatomic,strong) IntegralStoreViewModel *viewModel;
@end

@implementation IntegralStoreViewController

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IntegralStoreView *)mainView {
    if (!_mainView) {
        _mainView = [[IntegralStoreView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

-(IntegralStoreViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[IntegralStoreViewModel alloc] init];
    }
    return _viewModel;
}
@end
