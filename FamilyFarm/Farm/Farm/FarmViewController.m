//
//  FarmViewController.m
//  FamilyFarm
//
//  Created by user on 2017/10/18.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//
#import "FarmViewController.h"
#import "FarmView.h"
#import "FarmViewModel.h"
#import "FriendsCircleViewController.h"
#import "PlantingViewController.h"

@interface FarmViewController ()
@property(nonatomic,strong) FarmViewModel *viewModel;
@property(nonatomic,strong) FarmView *mainView;
@end

@implementation FarmViewController

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
    [[self.viewModel.farmHeadItemClickSubject takeUntil:self.rac_willDeallocSignal]  subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
        switch ([x intValue]) {
            case 0:
                [self pushPlanting];
                break;
                
            case 1:{
                [self pushFriendsCircle];
            }
            default:
                break;
        }
    }];
}

-(void)pushPlanting{
    PlantingViewController *friends = [[PlantingViewController alloc] init];
    [self.navigationController pushViewController:friends animated:YES];
}

-(void)pushFriendsCircle {
    FriendsCircleViewController *friendCircle = [[FriendsCircleViewController alloc] init];
    [self.navigationController pushViewController:friendCircle animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(FarmView *)mainView {
    if (!_mainView) {
        _mainView = [[FarmView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

-(FarmViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[FarmViewModel alloc] init];
    }
    return _viewModel;
}

@end
