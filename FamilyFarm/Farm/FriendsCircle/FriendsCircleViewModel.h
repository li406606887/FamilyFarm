//
//  FriendsCircleViewModel.h
//  FamilyFarm
//
//  Created by user on 2017/10/25.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "BaseViewModel.h"

@interface FriendsCircleViewModel : BaseViewModel
@property(nonatomic,strong) RACSubject *friendsCircleCellClickSubject;
@end
