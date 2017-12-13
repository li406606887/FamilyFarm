//
//  AddressViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/26.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressView.h"
#import "AddressViewModel.h"

@interface AddressViewController ()
@property(nonatomic,strong) AddressView *mainView;
@property(nonatomic,strong) AddressViewModel *viewModel;
@end

@implementation AddressViewController

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
-(AddressView *)mainView {
    if (!_mainView) {
        _mainView = [[AddressView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

-(AddressViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[AddressViewModel alloc] init];
    }
    return _viewModel;
}
@end
