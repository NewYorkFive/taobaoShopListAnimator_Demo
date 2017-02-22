//
//  ViewController.m
//  taobaoEffect
//
//  Created by NowOrNever on 18/02/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ViewController.h"
#import "DLAnimator.h"
#import "DLViewController.h"
@interface ViewController ()
@property (nonatomic, strong) DLAnimator *animator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}


- (void)setupUI{
    self.view.backgroundColor = [UIColor colorWithRed: 1 / 255.0 green: 150 / 255.0 blue: 1  alpha: 1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DLViewController *vc = [[DLViewController alloc] init];
    if (!_animator) {
        DLAnimator *animator = [[DLAnimator alloc] init];
        _animator = animator;
    }
    vc.transitioningDelegate = _animator;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
