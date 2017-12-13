//
//  SelfViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/18.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "SelfViewController.h"
#import "SelfView.h"
#import "SelfViewModel.h"
#import "ModifyInfoViewController.h"
#import "AddressViewController.h"
#import "OrderViewController.h"
#import "IntegralStoreViewController.h"
#import "MineGroupViewController.h"


@interface SelfViewController ()
@property(nonatomic,strong) SelfView *mainView;
@property(nonatomic,strong) SelfViewModel *viewModel;
@end

@implementation SelfViewController

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
    [[self.viewModel.modifyInfoClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        ModifyInfoViewController *modifyInfo = [[ModifyInfoViewController alloc] init];
        [self.navigationController pushViewController:modifyInfo animated:YES];
    }];
    [[self.viewModel.selfItemClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        switch ([x intValue]) {
            case 0:{
                AddressViewController *address = [[AddressViewController alloc] init];
                [self.navigationController pushViewController:address animated:YES];
            }
            case 1:{
                OrderViewController *order = [[OrderViewController alloc] init];
                [self.navigationController pushViewController:order animated:YES];
            }
            case 6:{
                IntegralStoreViewController *integralStore = [[IntegralStoreViewController alloc] init];
                [self.navigationController pushViewController:integralStore animated:YES];
            }
            case 7:{
                MineGroupViewController *mineGroup = [[MineGroupViewController alloc] init];
                [self.navigationController pushViewController:mineGroup animated:YES];
            }
                break;
                
            default:
                break;
        }
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
-(SelfViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[SelfViewModel alloc] init];
    }
    return _viewModel;
}
-(SelfView *)mainView {
    if (!_mainView) {
        _mainView = [[SelfView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}
@end
