//
//  AppDelegate.m
//  Demo1Proj
//
//  Created by mao wangxin on 2016/12/9.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "AppDelegate.h"
//@import Demo1FrameWork;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //导入头文件方式
//    NSBundle *bundle = [NSBundle bundleForClass:[Demo1VC1 class]];
//    if (bundle) {
//        self.window.rootViewController = [[Demo1VC1 alloc] initWithNibName:@"Demo1VC1" bundle:bundle];
//    } else {
//        self.window.rootViewController = [[Demo1VC1 alloc] init];
//    }

    
    //反射方式
    NSString *className = @"Demo1VC1";
    Class nameClass = NSClassFromString(className);
    NSBundle *bundle = [NSBundle bundleForClass:nameClass];
    UIViewController *demo1VC1 = [[nameClass alloc] initWithNibName:className bundle:bundle];
    self.window.rootViewController = demo1VC1?:[UIViewController new];
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
