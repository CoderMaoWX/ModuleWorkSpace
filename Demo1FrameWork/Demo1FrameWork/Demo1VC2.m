//
//  Demo1VC2.m
//  Demo1FrameWork
//
//  Created by Luke on 16/12/10.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "Demo1VC2.h"

@interface Demo1VC2 ()

@end

@implementation Demo1VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    NSLog(@"Demo1VC2 没有该属性: %@",key);
}

@end
