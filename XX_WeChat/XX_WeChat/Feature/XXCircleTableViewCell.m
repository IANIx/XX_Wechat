//
//  XXCircleTableViewCell.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXCircleTableViewCell.h"




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

@implementation XXStatusView


@end
@implementation XXCircleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _statusView = [XXStatusView new];
    _statusView.cell = self;
    _statusView.titleView.cell = self;
    _statusView.linkView.cell = self;
    _statusView.contentView.cell = self;
    _statusView.toolView.cell = self;
    _statusView.commentView.cell = self;
    [self.contentView addSubview:_statusView];
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setLayout:(XXCircleLayout *)layout {
    _statusView.layout = layout;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
