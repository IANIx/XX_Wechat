//
//  XXViewController.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/11.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXViewController.h"

@interface XXViewController ()

@end

@implementation XXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self hideNavigationBlackLine];
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


- (void)hideNavigationBlackLine {
    
    if (self.navigationController) {
        
        UIImageView *backgroundView = [self.navigationController.navigationBar valueForKey:@"_backgroundView"];
        for(UIView *view in backgroundView.subviews) {
            
            if(view.bounds.size.height <= 1.0f) {
                
                [view setHidden:YES];
                
            }
            
        }
        
    }
    
}

@end
