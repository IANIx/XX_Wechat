//
//  XXMainframeViewController.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/12.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXMainframeViewController.h"

@interface XXMainframeViewController ()

@end

@implementation XXMainframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XXLabel *label = [[XXLabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    label.text = @"jakfjhafuiyeiuoihjajafjayufuyajfkjakfhuahfi";
    [self.view addSubview:label];
    
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(100, 350, 200, 100)];
    textView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:textView];
    // Do any additional setup after loading the view.
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
