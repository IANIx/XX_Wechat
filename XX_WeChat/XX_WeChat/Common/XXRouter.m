//
//  XXRouter.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/12.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXRouter.h"

@implementation XXRouter

+ (void)map:(NSString *)route toControllerClass:(Class)controllerClass {
    
    [[HHRouter shared] map:route toControllerClass:controllerClass];
    
}

+ (UIViewController *)matchController:(NSString *)route {
    
    return [XXRouter matchController:route withDic:nil];
    
}

+ (UIViewController *)matchController:(NSString *)route withDic:(NSDictionary *)dic {
    
    UIViewController *viewController = [[HHRouter shared]matchController:route];
    
    if (dic) {
        [viewController setValuesForKeysWithDictionary:dic];
    }
    
    return viewController;
}

+ (UIViewController *)currentViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self findTopViewController:viewController];
}


#pragma mark - NV_Router Private

+ (UIViewController *)findTopViewController:(UIViewController *)vc {
    
    if (vc.presentedViewController) {
        // Return presented view controller
        return [self findTopViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController*)vc;
        if (svc.viewControllers.count > 0)
            return [self findTopViewController:svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController*)vc;
        if (svc.viewControllers.count > 0)
            return [self findTopViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController*)vc;
        if (svc.viewControllers.count > 0)
            return [self findTopViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
    
}

@end

@implementation UIViewController (XXRouter)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end

