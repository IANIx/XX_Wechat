//
//  XXTabBarController.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/12.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXTabBarController.h"
#import "XXNavigationController.h"

@interface XXTabBarController ()

@end

@implementation XXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = RGBCOLOR(25, 163, 24);
    

    UIViewController *viewController1 = [XXRouter matchController:@"mainframe"];
    UIViewController *viewController2 = [XXRouter matchController:@"contacts"];
    UIViewController *viewController3 = [XXRouter matchController:@"discover"];
    UIViewController *viewController4 = [XXRouter matchController:@"me"];
    
    NSArray *items = @[@{@"title":@"微信",
                         @"normalImage":@"tabbar_mainframe",
                         @"selectImage":@"tabbar_mainframeHL"},
                       @{@"title":@"通讯录",
                         @"normalImage":@"tabbar_contacts",
                         @"selectImage":@"tabbar_contactsHL"},
                       @{@"title":@"发现",
                         @"normalImage":@"tabbar_discover",
                         @"selectImage":@"tabbar_discoverHL"},
                       @{@"title":@"我",
                         @"normalImage":@"tabbar_me",
                         @"selectImage":@"tabbar_meHL"},];
    NSArray *viewControllers = @[viewController1,viewController2,viewController3,viewController4];
    [self setTabbarItems:items ViewControllers:viewControllers];
    self.viewControllers = [self addNavWithViewControllers:viewControllers];
    
    // Do any additional setup after loading the view.
}
- (void)setTabbarItems:(NSArray *)items ViewControllers:(NSArray *)viewControllers {
    [items enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage * normalImage = [[UIImage imageNamed:dic[@"normalImage"]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * selectImage = [[UIImage imageNamed:dic[@"selectImage"]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTitle:dic[@"title"] image:normalImage selectedImage:selectImage];
        ((UIViewController *)viewControllers[idx]).title = dic[@"title"];
        ((UIViewController *)viewControllers[idx]).tabBarItem = tabBarItem;
    }];
}
- (NSArray *)addNavWithViewControllers:(NSArray *)viewControllers {
    NSMutableArray *array = @[].mutableCopy;
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL * _Nonnull stop) {
        XXNavigationController *nav = [[XXNavigationController alloc]initWithRootViewController:viewController];
        [array addObject:nav];
    }];
    
    return array.copy;
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
