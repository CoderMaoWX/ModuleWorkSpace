//
//  Demo1VC1.m
//  Demo1FrameWork
//
//  Created by Luke on 16/12/10.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "Demo1VC1.h"
#import <UIImageView+WebCache.h>
#import <CommonDefine.h>

#define Demo1ImageName(name)   [UIImage imageNamed:[NSString stringWithFormat:@"Demo1Image.bundle/%@",name] inBundle:[NSBundle bundleForClass:NSClassFromString(@"Demo1VC1")] compatibleWithTraitCollection:nil]

@interface Demo1VC1 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation Demo1VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSBundle *bundle = [NSBundle bundleForClass:[Demo1VC1 class]];
//    UIImage *image = [UIImage imageNamed:@"images.bundle/zhifubao" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
    
    self.imageView.image = Demo1ImageName(@"zhifubao");
}

//加载网络图片
- (IBAction)loadWebImage:(id)sender
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=480345906,3012463706&fm=80&w=179&h=119&img.JPEG"]];
}

//从模块一跳转到模块二的类
- (IBAction)pushAction:(id)sender
{
    //月底约定跳转方式
    NSMutableDictionary *notifDic = [NSMutableDictionary dictionary];
    notifDic[kJumpTypeKey] = kJumpTypePrsentValue;
    notifDic[kJumpFromVCKey] = self;
    notifDic[kJumpToVCNameKey] = @"Demo2VC1";
    notifDic[kJumpVCDataKey] = @{@"nameStr":@"张三",@"userId":@"2016"};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JumpToOtherVCNotification object:notifDic];
}



@end
