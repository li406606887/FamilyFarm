//
//  CourseViewModel.m
//  FamilyFarm
//
//  Created by user on 2017/10/23.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "CourseViewModel.h"

@implementation CourseViewModel
-(RACSubject *)courseCellClickSubject {
    if (!_courseCellClickSubject) {
        _courseCellClickSubject = [RACSubject subject];
    }
    return _courseCellClickSubject;
}
@end
