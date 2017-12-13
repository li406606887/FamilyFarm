//
//  CourseViewModel.h
//  FamilyFarm
//
//  Created by user on 2017/10/23.
//  Copyright © 2017年 Jann_Lee. All rights reserved.
//

#import "BaseViewModel.h"

@interface CourseViewModel : BaseViewModel
@property(nonatomic,strong) RACSubject *courseCellClickSubject;
@end
