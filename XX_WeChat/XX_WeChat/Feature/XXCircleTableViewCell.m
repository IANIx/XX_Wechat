//
//  XXCircleTableViewCell.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXCircleTableViewCell.h"

#define top 8
#define left 5
#define right 5
#define bottom 8



@implementation XXCircleTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _avatarImageView = [[UIImageView alloc]initWithFrame:frame];
        [self addSubview:_avatarImageView];
    }
    return self;
}

@end

@implementation XXCircleLinkView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

@implementation XXCircleContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

@implementation XXCircleToolsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

@implementation XXCircleCommentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

@implementation XXCircleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
