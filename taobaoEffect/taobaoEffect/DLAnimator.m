//
//  DLAnimator.m
//  taobaoEffect
//
//  Created by NowOrNever on 18/02/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "DLAnimator.h"
#define kScreenBounsSize     [UIScreen mainScreen].bounds.size

@interface DLAnimator ()<UIViewControllerAnimatedTransitioning>

@end

@implementation DLAnimator

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 1;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    static int flag = 0;    //flag 确定是点击购物车，还是返回
    flag++;


    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *destinationView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;

    //    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //    UIView *destinationView = [transitionContext viewForKey:UITransitionContextToViewKey];
    NSLog(@"fromView ----- %@",fromView);
    NSLog(@"destinationView ----- %@",destinationView);

    
    
    if (flag % 2) { //动画效果处理
        [[transitionContext containerView] addSubview:destinationView];
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -0.001;
        transform = CATransform3DRotate(transform,  M_PI_4 * .2, 1, 0, 0);
        transform = CATransform3DTranslate(transform, 0, 0, -100);

        [UIView animateWithDuration:[self transitionDuration:nil] * 0.5 animations:^{
            fromView.layer.transform = transform;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:[self transitionDuration:nil] * 0.5 animations:^{
                fromView.layer.transform = CATransform3DMakeScale(.9, .9, 1);
            } completion:nil];
        }];
        
        destinationView.frame = [UIScreen mainScreen].bounds;
        destinationView.transform = CGAffineTransformTranslate(destinationView.transform, 0, kScreenBounsSize.height - 500);
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            destinationView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];

    }else{
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            fromView.transform = CGAffineTransformTranslate(fromView.transform, 0, kScreenBounsSize.height - 500);
            destinationView.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}
@end
