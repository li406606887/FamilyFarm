//
//  OrderViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/27.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderViewModel.h"
#import "OrderView.h"

@interface OrderViewController ()
@property(nonatomic,strong) OrderView * mainView;
@property(nonatomic,strong) OrderViewModel *viewModel;
@end

@implementation OrderViewController

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
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(OrderView *)mainView {
    if (!_mainView) {
        _mainView = [[OrderView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

-(OrderViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[OrderViewModel alloc] init];
    }
    return _viewModel;
}
@end
