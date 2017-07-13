//
//  XXMainframeViewController.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/12.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXMainframeViewController.h"

#import "UILabel+XXRichTextModel.h"
@interface XXMainframeViewController ()

@end

@implementation XXMainframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self richTextLable];
    // Do any additional setup after loading the view.
}
-(void)richTextLable
{
    //评论
    NSString *nameOne = @"张三";
    NSString *nameTwo = @"我是李四";
    NSString *replyString = @"您好，您现在在干什么，么么哒。这个功能应该满足需求了。";
    
    NSString *totalString = [NSString stringWithFormat:@"%@回复%@：%@",nameOne,nameTwo,replyString];
    NSMutableAttributedString *newString = [[NSMutableAttributedString alloc] initWithString:totalString];
    [newString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, totalString.length)];
    [newString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, nameOne.length)];
    [newString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(nameOne.length+2, nameTwo.length)];
    //设置行距 实际开发中间距为0太丑了，根据项目需求自己把握
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3;
    [newString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, totalString.length)];
    
    XXLabel *richTextLbl = [[XXLabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 20)];
    //richTextLbl.backgroundColor = [UIColor greenColor];
    richTextLbl.numberOfLines = 0;//设置UILable自适应
    richTextLbl.attributedText = newString;
    [self.view addSubview:richTextLbl];
    [richTextLbl sizeToFit];
    
    [richTextLbl onTapRangeActionWithString:@[nameOne,nameTwo] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"点击了-->--%@ ---下标：%ld",string,index);
    }];
    
    
    //点赞
    XXLabel *goodLbl = [[XXLabel alloc] init];
    goodLbl.frame = CGRectMake(20, 170, 100, 20);
    goodLbl.text = @"点赞的:";
    [self.view addSubview:goodLbl];
    
    NSArray *goodArray = @[@"张三",@"李四",@"王五",@"李兆",@"粟子",@"小李",@"李四",@"王五",@"李兆",@"粟子",@"小李"];
    NSString *goodTotalString = [goodArray componentsJoinedByString:@", "];
    
    NSMutableAttributedString *newGoodString = [[NSMutableAttributedString alloc] initWithString:goodTotalString];
    [newGoodString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, goodTotalString.length)];
    
    //设置行距 实际开发中间距为0太丑了，根据项目需求自己把握
    NSMutableParagraphStyle *paragraphstyle = [[NSMutableParagraphStyle alloc] init];
    paragraphstyle.lineSpacing = 3;
    [newGoodString addAttribute:NSParagraphStyleAttributeName value:paragraphstyle range:NSMakeRange(0, goodTotalString.length)];
    
    XXLabel *goodTextLbl = [[XXLabel alloc] initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40, 20)];
    goodTextLbl.backgroundColor = [UIColor orangeColor];
    goodTextLbl.numberOfLines = 0;//设置UILable自适应
    goodTextLbl.attributedText = newGoodString;
    //goodTextLbl.text = goodTotalString;
    [self.view addSubview:goodTextLbl];
    [goodTextLbl sizeToFit];
    
    [goodTextLbl onTapRangeActionWithString:goodArray tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"这是第--%ld--个点赞的,他是--%@",index,string);
    }];
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
