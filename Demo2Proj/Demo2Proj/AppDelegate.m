//
//  AppDelegate.m
//  Demo2Proj
//
//  Created by mao wangxin on 2016/12/9.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "AppDelegate.h"
//@import Demo2FrameWork;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //导入头文件方式
//    NSBundle *bundle = [NSBundle bundleForClass:[Demo2VC1 class]];
//    if (bundle) {
//        self.window.rootViewController = [[Demo2VC1 alloc] initWithNibName:@"Demo2VC1" bundle:bundle];
//    } else {
//        self.window.rootViewController = [[Demo2VC1 alloc] init];
//    }
    
    //反射方式
    NSString *name = @"Demo2VC1";
    Class class = NSClassFromString(name);
    NSBundle *bundle = [NSBundle bundleForClass:class];
    UIViewController *vc = [[class alloc] initWithNibName:name bundle:bundle];
    self.window.rootViewController = vc?:[UIViewController new];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
