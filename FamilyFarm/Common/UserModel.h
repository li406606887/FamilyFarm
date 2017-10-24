//
//  UserModel.h
//  QHTrade
//
//  Created by user on 2017/8/12.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property(nonatomic,copy) NSString* userName;
@property(nonatomic,copy) NSString* ID;
@property(nonatomic,copy) NSString* gender;
@property(nonatomic,copy) NSString* incomeRate;
@property(nonatomic,copy) NSString* balance;
@property(nonatomic,copy) NSString* diamond;
@property(nonatomic,copy) NSString* totalIncome;
@property(nonatomic,copy) NSString* positionRate;
@property(nonatomic,copy) NSString* positionCount;
@property(nonatomic,copy) NSString* state;//登录状态
@property(nonatomic,copy) NSString* userImg;
@property(nonatomic,copy) NSString* mobile;
@property(nonatomic,copy) NSString* ctpAccount;//交易账号
@property(nonatomic,copy) NSString* fierce;//是否为牛人
@property(nonatomic,copy) NSString* isFollows;//是否有跟单
@end
