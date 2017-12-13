//
//  SelfViewModel.m
//  FamilyFarm
//
//  Created by user on 2017/10/24.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "SelfViewModel.h"

@implementation SelfViewModel
-(RACSubject *)modifyInfoClickSubject {
    if (!_modifyInfoClickSubject) {
        _modifyInfoClickSubject = [RACSubject subject];
    }
    return _modifyInfoClickSubject;
}
-(RACSubject *)selfItemClickSubject {
    if (!_selfItemClickSubject) {
        _selfItemClickSubject = [RACSubject subject];
    }
    return _selfItemClickSubject;
}
@end
