//
//  AppDelegate.m
//  MainProj
//
//  Created by mao wangxin on 2016/12/9.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>
@import CommonFrameWork;
@import Demo1FrameWork;
@import Demo2FrameWork;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushOtherVCAction:) name:JumpToOtherVCNotification object:nil];
    
    return YES;
}

- (void)pushOtherVCAction:(NSNotification *)notify
{
    NSDictionary *notifyObj = [notify object];
    NSLog(@"notifyObj===%@",notifyObj);
    
    //通知一定要带字典参数，否则不予跳转
    if (![notifyObj isKindOfClass:[NSDictionary class]]) return;
    
    NSString *jumpType = notifyObj[kJumpTypeKey];//跳转方式
    UIViewController *jumpFromVC = notifyObj[kJumpFromVCKey];//从哪个控制器进行跳转
    NSString *jumpToVCName = notifyObj[kJumpToVCNameKey];//需要跳转到的控制器名字
    NSDictionary *jumpData = notifyObj[kJumpVCDataKey];//跳转时所带的参数
    
    //没有说明从哪里进行跳转，则不予跳转
    if (!jumpFromVC) return;
    
    UIViewController *jumpToVC = nil;
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(jumpToVCName)];
    if (bundle) {
        jumpToVC = [[NSClassFromString(jumpToVCName) alloc] initWithNibName:jumpToVCName bundle:bundle];
    } else {
        jumpToVC = [NSClassFromString(jumpToVCName) new];
    }
    
    //反射失败，不予跳转
    if (!jumpToVC) return;
    
    if (jumpData.count>0) {
        //1.这里需要先帮目的控制器动态添加下面的方法，防止设值崩溃
        //- (void)setValue:(id)value forKey:(NSString *)key
        //2.给目的控制器的属性设值
        [jumpToVC setValuesForKeysWithDictionary:jumpData];
    }
    
    if ([jumpType isEqualToString:kJumpTypePushValue]) { //push方式
        [jumpFromVC.navigationController pushViewController:jumpToVC animated:YES];
        
    } else if ([jumpType isEqualToString:kJumpTypePrsentValue]) { //模态方式
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:jumpToVC];
        [jumpFromVC presentViewController:navVC animated:YES completion:nil];
    }
}

/*

#pragma mark - 动态为类添加方法

- (void)createClass
{
    Class MyClass = objc_allocateClassPair([NSObject class], "myclass", 0);
    //添加一个NSString的变量，第四个参数是对其方式，第五个参数是参数类型
    if (class_addIvar(MyClass, "itest", sizeof(NSString *), 0, "@")) {
        NSLog(@"add ivar success");
    }
    //myclasstest是已经实现的函数，"v@:"这种写法见参数类型连接
    class_addMethod(MyClass, @selector(myclasstest:), (IMP)myclasstest, "v@:");
    //注册这个类到runtime系统中就可以使用他了
    objc_registerClassPair(MyClass);
    //生成了一个实例化对象
    id myobj = [[MyClass alloc] init];
    NSString *str = @"asdb";
    //给刚刚添加的变量赋值
    //object_setInstanceVariable(myobj, "itest", (void *)&str);在ARC下不允许使用
    [myobj setValue:str forKey:@"itest"];
    //调用myclasstest方法，也就是给myobj这个接受者发送myclasstest这个消息
    [myobj myclasstest:10];
    
}

//这个方法实际上没有被调用,但是必须实现否则不会调用下面的方法
- (void)myclasstest:(int)a
{
    
}

//调用的是这个方法
static void myclasstest(id self, SEL _cmd, int a) //self和_cmd是必须的，在之后可以随意添加其他参数
{
    Ivar v = class_getInstanceVariable([self class], "itest");
    //返回名为itest的ivar的变量的值
    id o = object_getIvar(self, v);
    //成功打印出结果
    NSLog(@"%@", o);
    NSLog(@"int a is %d", a);
}

*/

@end
