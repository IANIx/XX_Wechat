//
//  AppDelegate+Router.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/12.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Router)

/**
 * 注册路由
 * 所有的控制器获取都必须使用Router方式，并在此处注册路由
 */
- (void)registerRouter;

@end
