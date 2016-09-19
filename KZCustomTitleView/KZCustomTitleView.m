//
//  KZCustomTitleView.m
//  MyNavigationBar
//
//  Created by 龙邦 on 16/9/19.
//  Copyright © 2016年 longwatch. All rights reserved.
//

#import "KZCustomTitleView.h"

#define blue_color [UIColor colorWithRed:18/255.0 green:183/255.0 blue:254/255.0 alpha:1.0]

#define screenWidth [UIScreen mainScreen].bounds.size.width

@interface KZCustomTitleView ()

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation KZCustomTitleView

@synthesize leftLabel,rightLabel;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentView];
    }
    return self;
}
- (void)setContentView {
    
    _chooseTitleColor = blue_color;
    _unChooseTitleColor = [UIColor whiteColor];
    _twoTitles = @[@"LeftTitle",@"RightTitle"];
    
    CGFloat barViewW = screenWidth/3;
    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setCornerRadius:5];
    
    //左侧lable
    leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, barViewW/2, CGRectGetHeight(self.frame))];
    UIBezierPath *leftMaskPath = [UIBezierPath bezierPathWithRoundedRect:leftLabel.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(5.0f, 5.0f)];
    CAShapeLayer *leftMaskLayer = [CAShapeLayer layer];
    leftMaskLayer.frame = leftLabel.bounds;
    leftMaskLayer.path = leftMaskPath.CGPath;
    leftLabel.layer.mask = leftMaskLayer;
    [leftLabel setBackgroundColor:[UIColor whiteColor]];
    [leftLabel setText:_twoTitles[0]];
    [leftLabel setTextAlignment:NSTextAlignmentCenter];
    [leftLabel setFont:[UIFont systemFontOfSize:13]];
    [leftLabel setTextColor:blue_color];
    UITapGestureRecognizer *leftLabelGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftLabelClicked)];
    [leftLabel setUserInteractionEnabled:NO];
    [leftLabel addGestureRecognizer:leftLabelGesture];
    [self addSubview:leftLabel];
    
    //右侧label
    rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(barViewW/2, 0, barViewW/2, CGRectGetHeight(self.frame))];
    UIBezierPath *rightMaskPath = [UIBezierPath bezierPathWithRoundedRect:rightLabel.bounds byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0f, 5.0f)];
    CAShapeLayer *rightMaskLayer = [CAShapeLayer layer];
    rightMaskLayer.frame = rightLabel.bounds;
    rightMaskLayer.path = rightMaskPath.CGPath;
    rightLabel.layer.mask = rightMaskLayer;
    [rightLabel setBackgroundColor:blue_color];
    [rightLabel setText:_twoTitles[1]];
    [rightLabel setTextAlignment:NSTextAlignmentCenter];
    [rightLabel setFont:[UIFont systemFontOfSize:13]];
    [rightLabel setTextColor:[UIColor whiteColor]];
    UITapGestureRecognizer *rightLabelGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightLabelClicked)];
    [rightLabel setUserInteractionEnabled:YES];
    [rightLabel addGestureRecognizer:rightLabelGesture];
    [self addSubview:rightLabel];
    
}

- (void)setTwoTitles:(NSArray *)twoTitles {
    _twoTitles = twoTitles;
    if ([twoTitles count]) {
        [leftLabel setText:twoTitles[0]];
        if ([twoTitles count]>1) {
            [rightLabel setText:twoTitles[1]];
        } else {
            [rightLabel setText:@"RightTitle"];
        }
    } else {
        [leftLabel setText:@"LeftTitle"];
    }
}

- (void)setChooseTitleColor:(UIColor *)chooseTitleColor {
    _chooseTitleColor = chooseTitleColor;
    [leftLabel setTextColor:chooseTitleColor];
    [rightLabel setBackgroundColor:chooseTitleColor];
}
- (void)setUnChooseTitleColor:(UIColor *)unChooseTitleColor {
    _unChooseTitleColor = unChooseTitleColor;
    [leftLabel setBackgroundColor:unChooseTitleColor];
    [rightLabel setTextColor:unChooseTitleColor];
}
- (void)leftLabelClicked {
    [leftLabel setUserInteractionEnabled:NO];
    [rightLabel setUserInteractionEnabled:YES];
    [leftLabel setBackgroundColor:_unChooseTitleColor];
    [leftLabel setTextColor:_chooseTitleColor];
    [rightLabel setBackgroundColor:_chooseTitleColor];
    [rightLabel setTextColor:_unChooseTitleColor];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(kLeftLabelClicked)]) {
        [self.delegate kLeftLabelClicked];
    }
}
- (void)rightLabelClicked {
    [rightLabel setUserInteractionEnabled:NO];
    [leftLabel setUserInteractionEnabled:YES];
    [rightLabel setBackgroundColor:_unChooseTitleColor];
    [rightLabel setTextColor:_chooseTitleColor];
    [leftLabel setBackgroundColor:_chooseTitleColor];
    [leftLabel setTextColor:_unChooseTitleColor];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(kRightLabelClicked)]) {
        [self.delegate kRightLabelClicked];
    }
}
@end