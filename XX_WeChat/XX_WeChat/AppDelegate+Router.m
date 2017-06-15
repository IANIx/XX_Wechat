//
//  AppDelegate+Router.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/12.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "AppDelegate+Router.h"
#import "XXContactsViewController.h"
#import "XXMeViewController.h"
#import "XXDiscoverViewController.h"
#import "XXMainframeViewController.h"
#import "XXFriendsCircleViewController.h"

@implementation AppDelegate (Router)

- (void)registerRouter {
    [XXRouter map:@"contacts" toControllerClass:[XXContactsViewController class]];
    [XXRouter map:@"me" toControllerClass:[XXMeViewController class]];
    [XXRouter map:@"discover" toControllerClass:[XXDiscoverViewController class]];
    [XXRouter map:@"mainframe" toControllerClass:[XXMainframeViewController class]];
    
    [XXRouter map:@"discover/friendCircle" toControllerClass:[XXFriendsCircleViewController class]];
}
@end
