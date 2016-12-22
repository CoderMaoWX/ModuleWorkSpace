//
//  Demo2VC1.m
//  Demo2FrameWork
//
//  Created by Luke on 16/12/10.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "Demo2VC1.h"
#import <UIImageView+WebCache.h>
@import CommonFrameWork;

// 获取随机颜色
#define randomColor [UIColor colorWithRed:arc4random_uniform(( arc4random() % 256 / 256.0 )) green:( arc4random() % 256 / 256.0 ) blue:( arc4random() % 256 / 256.0 ) alpha:1]

// 获取图片
#define Demo2ImageName(name)   [UIImage imageNamed:[NSString stringWithFormat:@"images.bundle/%@",name] inBundle:[NSBundle bundleForClass:NSClassFromString(@"Demo2VC1")] compatibleWithTraitCollection:nil]

@interface Demo2VC1 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation Demo2VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo2VC1";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"nameStr===%@",self.nameStr);
    
    NSLog(@"commom包数据====%@",[GlobalManager shareInstance].userInfoName);
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2805861143,1292057716&fm=58"]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.view.backgroundColor = randomColor;
}

- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    NSLog(@"Demo1SecondVC 没有该属性: %@",key);
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
