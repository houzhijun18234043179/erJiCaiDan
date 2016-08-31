//
//  HorizontalMenuView.m
//  shuipingcaidan
//
//  Created by iOS developer on 16/8/31.
//  Copyright © 2016年 iOS developer. All rights reserved.
//

#import "HorizontalMenuView.h"

@implementation HorizontalMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setNameWithArray:(NSArray *)menuArray
{
    
    _menuArray = menuArray;
    CGFloat SPACE = (self.frame.size.width)/[_menuArray count];
    for (int i  = 0; i < [menuArray count]; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(SPACE *i, 0, SPACE, self.frame.size.height);
        but.tag = i;
        if (but.tag == 0) {
            but.enabled = NO;
        }
        //设置字体大小
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[menuArray objectAtIndex:i]];
        [str addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, [str length])];
        [but setAttributedTitle:str forState:UIControlStateNormal];
        NSMutableAttributedString *selStr = [[NSMutableAttributedString alloc]initWithString:[menuArray objectAtIndex:i]];
        [str addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, [str length])];
        [but setAttributedTitle:selStr forState:UIControlStateDisabled];
        [but addTarget:self action:@selector(ButClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:but];
        
        //分割线
        if (i > 0 && self.frame.size.height>16) {
            UIView *line =[[UIView alloc]initWithFrame:CGRectMake(SPACE *i, 8, 1, self.frame.size.height -16)];
            line.backgroundColor = [UIColor grayColor];
            [self addSubview:line];
        }
        }
    
    //底部下划线
    UIView *line =[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 2.5, self.frame.size.width , 1.5)];
    line.backgroundColor =[ UIColor grayColor];
    [self addSubview:line];
    //标示当选中下划线
    UIView *markLine =[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-4, SPACE +1 ,3)];
    markLine.tag =999;
    markLine.backgroundColor =[UIColor orangeColor];
    [self addSubview:markLine];
    
    
    
    
}


#pragma mark 菜单懒得点击事件
-(void)ButClick:(UIButton *)sender{
    
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *subBut = (UIButton *)subView;
            if (subBut.tag == sender.tag) {
                [subBut setEnabled:NO];
            }else{
                [subBut setEnabled:YES];
            }
        }
    }
    CGFloat  SPACE = (self.frame.size.width)/[_menuArray count];
    
    UIView *markView = [self viewWithTag:999];
    [UIView animateWithDuration:0.2f animations:^{
        CGRect markFrame =  markView.frame;
        markFrame.origin.x = sender.tag *SPACE;
        markView.frame = markFrame;
        
    }];
    
    if ([self.myDelagate respondsToSelector:@selector(getTag:)]) {
        [self.myDelagate getTag:sender.tag];
    }
    
}








@end
