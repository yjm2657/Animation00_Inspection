//
//  ViewController.m
//  Animation00_Inspection
//
//  Created by YJM on 2017/6/21.
//  Copyright © 2017年 YJM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic)UIView *lightView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.lightView];
    
    [self setAnimation];
    
}

- (UIView *)lightView{
    if (!_lightView) {
        UIView *lightView = [[UIView alloc]init];
        lightView.center = CGPointMake(100, 200);
        lightView.bounds = CGRectMake(0, 0, 100, 80);
        lightView.backgroundColor = [UIColor whiteColor];
        _lightView = lightView;
    }
    return _lightView;
}

- (void)setAnimation{
    CAReplicatorLayer *repl = [CAReplicatorLayer layer];
    repl.frame = self.lightView.bounds;
    [self.lightView.layer addSublayer:repl];
    
    CALayer *layer = [CALayer layer];
//    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.position = CGPointMake(10, self.lightView.bounds.size.height / 2.0);
    layer.bounds = CGRectMake(0, 0, 20, 80);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [repl addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0.4;
    anim.duration = 0.8;
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
    
    repl.instanceCount = 9;
    repl.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    repl.instanceDelay = 1.8;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
