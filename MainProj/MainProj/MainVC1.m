//
//  MainVC1.m
//  MainProj
//
//  Created by Luke on 16/12/10.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "MainVC1.h"
#import <UIImageView+WebCache.h>
//#import <GlobalManager.h>
@import CommonFrameWork;
@import Demo1FrameWork;

@interface MainVC1 ()
@property (weak, nonatomic) IBOutlet UILabel *textLab;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) NSInteger count;
@end

@implementation MainVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textLab.text = [GlobalManager shareInstance].userInfoName;
    
//    NSBundle *bundle = [NSBundle bundleForClass:[Demo1VC1 class]];
//    UIImage *image = [UIImage imageNamed:@"images.bundle/zhifubao" inBundle:bundle compatibleWithTraitCollection:nil];
//    self.imageView.image = image;
    
    self.imageView.image = ImageWithName(@"icon_weixin");
}

- (IBAction)gotoDemo1VC:(id)sender
{
    NSBundle *bundle = [NSBundle bundleForClass:[Demo1VC1 class]];
    
    Demo1VC1 *demo1VC1 = [[Demo1VC1 alloc] initWithNibName:@"Demo1VC1" bundle:bundle];
    demo1VC1.title = @"Demo1VC1";
    demo1VC1.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:demo1VC1 animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1597993514,3473150366&fm=85&s=10A29A1956724A390ABFEF880300F08F"]];
}

- (IBAction)modifyCommonDataAction:(id)sender
{
    self.count++;
    
    [GlobalManager shareInstance].userInfoName = [NSString stringWithFormat:@"修改commom包的数据: %zd", self.count];
    
    self.tipLabel.text = [GlobalManager shareInstance].userInfoName;
}


//从每个子模块中去加载图片
UIImage* ImageWithName(NSString *name)
{
    //到主模块中取图片
    UIImage *commomImage = [UIImage imageNamed:[NSString stringWithFormat:@"commonImage.bundle/%@",name] inBundle:[NSBundle bundleForClass:NSClassFromString(@"GlobalManager")] compatibleWithTraitCollection:nil];
    if (commomImage) {
        return commomImage;
        
    } else {
        //到模块一中取图片
        UIImage *demo1Image = [UIImage imageNamed:[NSString stringWithFormat:@"Demo1Image.bundle/%@",name] inBundle:[NSBundle bundleForClass:NSClassFromString(@"Demo1VC1")] compatibleWithTraitCollection:nil];
        if (demo1Image) {
            return demo1Image;
            
        } else {
            //模块二中取图片
            return [UIImage imageNamed:[NSString stringWithFormat:@"Demo2Image.bundle/%@",name] inBundle:[NSBundle bundleForClass:NSClassFromString(@"Demo2VC1")] compatibleWithTraitCollection:nil];
        }
    }
}

@end
