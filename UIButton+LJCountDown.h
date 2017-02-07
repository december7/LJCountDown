//
//  UIButton+LJCountDown.h
//  LJCountDown
//
//  Created by 李彬 on 16/1/18.
//  Copyright © 2016年 song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LJCountDown)
-(void)startCountWithTime:(NSInteger)time  subTitle:(NSString*)subTitle disabledColor:(UIColor*)disabledColor;
@end
