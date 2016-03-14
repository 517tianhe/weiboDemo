//
//  ViewController.m
//  TYDemo
//
//  Created by wanglj on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ViewController.h"
#import "TYAttributedLabel.h"
#import "UIView+SDAutoLayout.h"
#import "UIView+ShortCut.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiSet];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)uiSet {
    
    TYAttributedLabel *label = [[TYAttributedLabel alloc]init];
    label.text = @"\t总有一天你将破蛹而出，成长得比人们期待的还要美丽。但这个过程会很痛，会很辛苦，有时候还会觉得灰心。面对着汹涌而来的现实，觉得自己渺小无力。但这，也是生命的一部分。做好现在你能做的，然后，一切都会好的。我们都将孤独地长大，不要害怕。";
    // 文字间隙
    label.characterSpacing = 2;
    // 文本行间隙
    label.linesSpacing = 2;
    
    label.lineBreakMode = kCTLineBreakByTruncatingTail;
    label.numberOfLines = 0;
    // 文本字体
    label.font = [UIFont systemFontOfSize:17];
    label.backgroundColor = [UIColor blueColor];
    
    // 设置view的位置和宽，会自动计算高度
    [label setFrameWithOrign:CGPointMake(0, 64) Width:CGRectGetWidth(self.view.frame)-80];
    NSLog(@"%@",NSStringFromCGRect(label.frame));
    
    
    UIView * backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    backView.sd_layout
    .topSpaceToView(self.view ,64)
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view,20)
    .bottomSpaceToView(self.view,20);
    [backView addSubview:label];
    
    
    label.sd_layout
    .topSpaceToView(backView,20)
    .leftSpaceToView(backView,20)
    .rightSpaceToView(backView,20)
    .heightIs(label.height);
    
    NSString *text = @"\t任何值得去的地方，都没有捷径；\n\t任何值得等待的人，都会迟来一些；\n\t任何值得追逐的梦想，都必须在一路艰辛中备受嘲笑。\n\t所以，不要怕，不要担心你所追逐的有可能是错的。\n\t因为，不被嘲笑的梦想不是梦想。\n";
    NSArray *textArray = [text componentsSeparatedByString:@"\n\t"];
    NSMutableAttributedString *totalAttributedString = [[NSMutableAttributedString alloc]init];
    for (NSString *text in textArray) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
        [attributedString addAttributeFont:[UIFont systemFontOfSize:15+arc4random()%4]];
        [totalAttributedString appendAttributedString:attributedString];
        [totalAttributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n\t"]];
       
    }
    
    TYAttributedLabel *label2 = [[TYAttributedLabel alloc]init];
    [label2 setAttributedText:totalAttributedString];
    
    label2.linesSpacing = 5;
    label2.characterSpacing = 2;
    label2.backgroundColor = [UIColor yellowColor];
    [label2 setFrameWithOrign:CGPointMake(0,0) Width:CGRectGetWidth(label.frame)];
        NSLog(@"%@",NSStringFromCGRect(label2.frame));
    [backView addSubview:label2];
    label2.sd_layout
    .topSpaceToView(label,10)
    .leftSpaceToView(backView,20)
    .rightSpaceToView(backView,20)
    .heightIs(label2.height);
    
    

}

@end
