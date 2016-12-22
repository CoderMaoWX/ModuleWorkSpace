//
//  GlobalManager.h
//  CommonFrameWork
//
//  Created by mao wangxin on 2016/12/9.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalManager : NSObject

/** 当前用户信息 */
@property (nonatomic, strong) NSString *userInfoName;

/**
 * 单利对象
 */
+ (instancetype)shareInstance;

@end
