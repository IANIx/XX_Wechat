//
//  XXNavigationController.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/11.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXNavigationController.h"

@interface XXNavigationController ()
@property (nonatomic, strong) UIView *blurBackView;
@end

@implementation XXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.barTintColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
}
- (UIView *)blurBackView
{
    if (_blurBackView == nil) {
        _blurBackView = [UIView new];
        _blurBackView.frame = CGRectMake(0, -20, [[UIScreen mainScreen]bounds].size.width, 64);
        CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
        gradientLayer.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 64);
        gradientLayer.colors = @[(__bridge id)HexAlphaColor(0x040012, 1).CGColor,
                                 (__bridge id)HexAlphaColor(0x040012, 1).CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
        [_blurBackView.layer addSublayer:gradientLayer];
        _blurBackView.userInteractionEnabled = NO;
        _blurBackView.alpha = 0.5;
    }
    return _blurBackView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
