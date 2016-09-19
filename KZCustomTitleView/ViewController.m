//
//  ViewController.m
//  KZCustomTitleView
//
//  Created by 龙邦 on 16/9/19.
//  Copyright © 2016年 KZ. All rights reserved.
//

#import "ViewController.h"
#import "KZCustomTitleView.h"

#define blue_color [UIColor colorWithRed:18/255.0 green:183/255.0 blue:254/255.0 alpha:1.0]

@interface ViewController ()<KZCustomTitleViewDelegate>

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation ViewController

@synthesize leftLabel,rightLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:blue_color];
    self.view.backgroundColor = [UIColor whiteColor];
    
    KZCustomTitleView *view = [[KZCustomTitleView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/3, 25)];
    view.twoTitles = @[@"报警定位",@"车辆定位"];
    view.chooseTitleColor = blue_color;
    view.unChooseTitleColor = [UIColor whiteColor];
    view.delegate = self;
    self.navigationItem.titleView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-KZNavigationTitleViewDelegate
- (void)kLeftLabelClicked {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
- (void)kRightLabelClicked {
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

@end
