//
//  GlobalManager.m
//  CommonFrameWork
//
//  Created by mao wangxin on 2016/12/9.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "GlobalManager.h"

@implementation GlobalManager

#pragma mark - 初始化 AppGlobalManager 单例

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static GlobalManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+ (instancetype)shareInstance
{
    return [[self alloc] init];
}

- (NSString *)userInfoName
{
    if (!_userInfoName) {
        return @"GlobalManager.userInfoName";
    }
    return _userInfoName;
}


@end
