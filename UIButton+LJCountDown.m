

//
//  UIButton+LJCountDown.m
//  LJCountDown
//
//  Created by 李彬 on 16/1/18.
//  Copyright © 2016年 song. All rights reserved.
//

#import "UIButton+LJCountDown.h"

@implementation UIButton (LJCountDown)
- (void)startCountWithTime:(NSInteger)time subTitle:(NSString*)subTitle disabledColor:(UIColor*)disabledColor
{
    __block NSInteger timeOut = time+1;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        timeOut--;
        if (timeOut == 0) {
             dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.selected=NO;
                self.userInteractionEnabled = YES;
            });
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.selected=YES;
                [self setTitleColor:disabledColor forState:UIControlStateSelected];
                [self setTitle:[NSString stringWithFormat:@"%@%lds", subTitle, timeOut] forState:UIControlStateSelected];
                self.userInteractionEnabled = NO;
            });
        }
    });
    dispatch_resume(timer);
}

@end
