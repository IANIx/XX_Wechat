//
//  XXCircleLayout.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXCircleLayout.h"

@implementation XXCircleLayout

- (instancetype)initWithItem:(XXCircleitem *)item {
    self.item = item;
    self = [super init];
    [self layout];
    return self;
}
- (void)layout {
    _height = 0;
    _marginTop = CellTopMargin;
    _marginBottom = CellBottomMargin;
    _profileHeight = 0;
    _textHeight = 0;
    _picHeight = 0;
    _toolbarHeight = CellToolBarHeight;
    _interactionHeight = 0;
    
    [self layoutContent];
    [self layoutInterction];
    
    _height += _marginTop;
    _height += _contentHeight;
    _height += _toolbarHeight;
    _height += _interactionHeight;
    _height += _marginBottom;
}
- (void)layoutContent {
    [self layoutTitle];
    [self layoutText];
    [self layoutPic];
    
    _contentHeight = 0;
    _contentHeight += _profileHeight;
    _contentHeight += kCellContentPadding;
    _contentHeight += _textHeight;
    _contentHeight += kCellContentPadding;
    _contentHeight += _picHeight;

}
- (void)layoutTitle {
    CGSize tempSize = [_item.user.nickname boundingRectWithSize:CGSizeMake(MAXFLOAT, 20000.f)
                                             options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:CellTextSize]}
                                                        context:nil].size;
    _profileHeight = tempSize.height;

}
- (void)layoutText {
    CGSize tempSize = [_item.text boundingRectWithSize:CGSizeMake(kWBCellContentWidth - 40 - kWBCellPadding, 20000.f)
                                                        options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:CellTextSize]}
                                                        context:nil].size;
    _textHeight = ceilf(tempSize.height);
    

}
- (void)layoutPic {
    if (_item.pics.count == 0) return;
    
    CGSize picSize = CGSizeZero;
    CGFloat picHeight = 0;
    
    CGFloat len1_3 = (kWBCellContentWidth + kWBCellPaddingPic) / 3 - kWBCellPaddingPic;
    len1_3 = CGFloatPixelRound(len1_3);
    switch (_item.pics.count) {
        case 1: {
            picSize = [self getImageSizeWithURL:_item.pics.firstObject];
            picHeight = picSize.height;
        } break;
            
        case 2: case 3: {
            picSize = CGSizeMake(len1_3, len1_3);
            picHeight = len1_3;
        }break;
            
        case 4: case 5: case 6: {
            picSize = CGSizeMake(len1_3, len1_3);
            picHeight = len1_3 * 2 + kWBCellPaddingPic;
        } break;
            
        default: { // 7, 8, 9
            picSize = CGSizeMake(len1_3, len1_3);
            picHeight = len1_3 * 3 + kWBCellPaddingPic * 2;
        } break;
    }
    _picSize = picSize;
    _picHeight = picHeight;
}
- (void)layoutInterction {
    CGFloat likesHeight = 0;
    if (_item.likes > 0 && _item.likes != nil) {
        //♥
        __block NSString *likes = @"♡";
        [_item.likes enumerateObjectsUsingBlock:^(XXCircleUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            likes  = [NSString stringWithFormat:@"%@,%@",likes,obj.nickname];
        }];
        CGSize tempSize = [likes boundingRectWithSize:CGSizeMake(MAXFLOAT, 20000.f)
                                              options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:CellTextSize]}
                                              context:nil].size;
        likesHeight = tempSize.height;
    }
    
    __block CGFloat commentHeight = 0;
    [_item.comments enumerateObjectsUsingBlock:^(XXCircleComment * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string;
        if (obj.Reply.length > 0) {
            string  = [NSString stringWithFormat:@"%@回复%@：%@",obj.Commentator,obj.Reply,obj.content];
        } else {
            string  = [NSString stringWithFormat:@"%@：%@",obj.Commentator,obj.content];
        }
        CGSize tempSize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 20000.f)
                                              options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:CellTextSize]}
                                              context:nil].size;
        commentHeight += tempSize.height;
    }];
    _interactionHeight = likesHeight + commentHeight;
    
}
- (CGSize)getImageSizeWithURL:(id)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;                  // url不正确返回CGSizeZero
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self getPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self getGIFImageSizeWithRequest:request];
    }
    else{
        size = [self getJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))                    // 如果获取文件头信息失败,发送异步请求请求原图
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
            size = image.size;
        }
    }
    return size;
}
//  获取PNG图片的大小
- (CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取gif图片的大小
- (CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取jpg图片的大小
- (CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}
CGFloat YYScreenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

static inline CGFloat CGFloatPixelRound(CGFloat value) {
    CGFloat scale = YYScreenScale();
    return round(value * scale) / scale;
}
@end
