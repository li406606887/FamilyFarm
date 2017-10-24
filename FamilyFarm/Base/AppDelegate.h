//
//  AppDelegate.h
//  FamilyFarm
//
//  Created by user on 2017/10/17.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TabBarBaseController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(nonatomic,strong) TabBarBaseController *main;

- (void)saveContext;


@end

