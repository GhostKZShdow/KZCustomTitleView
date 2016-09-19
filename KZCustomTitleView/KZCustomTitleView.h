//
//  KZCustomTitleView.h
//  MyNavigationBar
//
//  Created by 龙邦 on 16/9/19.
//  Copyright © 2016年 longwatch. All rights reserved.
//

/*
 将KZCustomTitleView.h和KZCustomTitleView.m导入工程中
 初始化一个KZCustomTitleView对象
 可以设置标题的内容（twoTitles），标题的颜色（chooseTitleColor）和标题的背景色（unChooseTitleColor）
 在代理方法中处理点击左侧按钮和右侧按钮事件
 */

#import <UIKit/UIKit.h>

@protocol KZCustomTitleViewDelegate <NSObject>

- (void)kLeftLabelClicked;

- (void)kRightLabelClicked;

@end
@interface KZCustomTitleView : UIView

//标题数组,数组的前两位设置为标题－默认为@[@"LeftTitle",@"RightTitle"];
@property (nullable, nonatomic, copy) NSArray *twoTitles;

//选中文字的颜色－默认为蓝色
@property (nullable, nonatomic, copy) UIColor *chooseTitleColor;

//未选中文字的颜色－默认为白色
@property (nullable, nonatomic, copy) UIColor *unChooseTitleColor;

@property (nullable, nonatomic, weak) id <KZCustomTitleViewDelegate> delegate;

@end
