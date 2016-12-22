//
//  MainVC2.m
//  MainProj
//
//  Created by Luke on 16/12/10.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "MainVC2.h"
@import CommonFrameWork;

@interface MainVC2 ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation MainVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.textLabel.text = [GlobalManager shareInstance].userInfoName;
}

@end
