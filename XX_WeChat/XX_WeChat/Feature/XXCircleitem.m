//
//  XXCircleitem.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXCircleitem.h"

@implementation XXCircleComment

@end
@implementation XXCircleUser


@end

@implementation XXCircleitem
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"comments" : [XXCircleComment class],
             @"likes" : [XXCircleUser class],
             @"user":[XXCircleUser class]};
}
@end
