//
//  XXCircleitem.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXCircleUser : NSObject

@property (nonatomic, strong) NSString  *nickname;
@property (nonatomic, strong) NSString  *icon_url;

@end

@interface XXCircleComment : NSObject

@property (nonatomic, strong) NSString *Commentator;
@property (nonatomic, strong) NSString *Reply;
@property (nonatomic, strong) NSString *content;


@end

@interface XXCircleitem : NSObject

@property (nonatomic, strong) XXCircleUser *user; ///< 发布者
@property (nonatomic, strong) NSString *text; ///<正文
@property (nonatomic, strong) NSString *create_time; ///<创建时间 最好是个时间戳
@property (nonatomic, strong) NSArray<NSURL *>  *pics; ///< 图片
@property (nonatomic, strong) NSArray<XXCircleUser *> *likes;///< 点赞
@property (nonatomic, strong) NSArray<XXCircleComment *> *comments; ///< 评论内容


@end
