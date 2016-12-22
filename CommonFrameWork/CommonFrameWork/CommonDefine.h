//
//  CommonDefine.h
//  CommonFrameWork
//
//  Created by Luke on 16/12/10.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

//======================= 全局通知宏 =======================

#define JumpToOtherVCNotification         @"JumpToOtherVCNotification"





//======================= 全局通用宏 =======================

//跳转方式 eg: push，prsent
#define kJumpTypeKey                         @"kJumpTypeKey"

//push跳转方式
#define kJumpTypePushValue                   @"kJumpTypePushValue"
//prsent跳转方式
#define kJumpTypePrsentValue                 @"kJumpTypePrsentValue"

//从哪个控制器进行跳转
#define kJumpFromVCKey                       @"kJumpFromVCKey"

//跳往哪个控制器
#define kJumpToVCNameKey                     @"kJumpToVCNameKey"

//跳转时所带的参数
#define kJumpVCDataKey                       @"kJumpVCDataKey"






#endif /* CommonDefine_h */
