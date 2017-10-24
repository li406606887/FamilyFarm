//
//  TabBarBaseController.m
//  RDFuturesApp
//
//  Created by user on 17/2/28.
//  Copyright © 2017年 FuturesApp. All rights reserved.
//

#import "TabBarBaseController.h"
#import "NavigationBaseController.h"
#import "QHTabBar.h"
#import "PromptView.h"
#import "FarmViewController.h"
#import "CourseViewController.h"
#import "ServiceViewController.h"
#import "StoreViewController.h"
#import "SelfViewController.h"

@interface TabBarBaseController ()
@property(nonatomic,assign)int oldIndex;
@end

@implementation TabBarBaseController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    [self setValue:[[QHTabBar alloc] init] forKeyPath:@"tabBar"];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSDictionary *attrs =@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(153, 153, 153),};

    
    NSDictionary *selectedAttrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(255, 98, 1)};
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    /*
     * 添加子导航栏控制器
     */
    [self setupChildVc:[[FarmViewController alloc] init] title:@"农场" image:@"TabBar_Share_Selected" selectedImage:@"TabBar_Share_Selected"];

    [self setupChildVc:[[CourseViewController alloc] init] title:@"课堂" image:@"TabBar_Share_Selected" selectedImage:@"TabBar_Share_Selected"];

    [self setupChildVc:[[ServiceViewController alloc] init] title:@"商家" image:@"TabBar_Share_Selected" selectedImage:@"TabBar_Share_Selected"];

    [self setupChildVc:[[StoreViewController alloc] init] title:@"商城" image:@"TabBar_Share_Selected" selectedImage:@"TabBar_Share_Selected"];
    
    [self setupChildVc:[[SelfViewController alloc] init] title:@"我的" image:@"TabBar_Share_Selected" selectedImage:@"TabBar_Share_Selected"];

//    [self addNotification];
}

- (UINavigationController *)yq_navigationController {
    return self.selectedViewController;
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    NavigationBaseController *nav = [[NavigationBaseController alloc] initWithRootViewController:vc];
    
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_image"] forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.barTintColor = [UIColor whiteColor];
    [nav.navigationBar setBackgroundColor:RGB(38, 74, 254)];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                NSFontAttributeName:[UIFont systemFontOfSize:18]
                                                }];
    [self addChildViewController:nav];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}
-(void)outLogin{
    NavigationBaseController *nav = [self getCurrentVC];
    if(nav.childViewControllers.count>1){
        [nav popToRootViewControllerAnimated:NO];
    }
    self.selectedIndex = 0;
}
- (NavigationBaseController *)getCurrentVC
{
    NavigationBaseController *nav ;
    int index = (int)self.selectedIndex;
    nav = self.childViewControllers[index]; 
    return nav;
}
-(void)addNotification {

}

@end
