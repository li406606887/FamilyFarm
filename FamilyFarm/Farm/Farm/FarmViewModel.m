//
//  FarmViewModel.m
//  FamilyFarm
//
//  Created by user on 2017/10/18.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "FarmViewModel.h"

@implementation FarmViewModel

-(RACSubject *)farmHeadItemClickSubject {
    if (!_farmHeadItemClickSubject) {
        _farmHeadItemClickSubject = [RACSubject subject];
    }
    return _farmHeadItemClickSubject;
}
@end
