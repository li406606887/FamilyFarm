//
//  FriendsCircleViewModel.m
//  FamilyFarm
//
//  Created by user on 2017/10/25.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FriendsCircleViewModel.h"

@implementation FriendsCircleViewModel


-(RACSubject *)friendsCircleCellClickSubject {
    if (!_friendsCircleCellClickSubject) {
        _friendsCircleCellClickSubject = [RACSubject subject];
    }
    return _friendsCircleCellClickSubject;
}
@end
