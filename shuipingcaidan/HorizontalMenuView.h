//
//  HorizontalMenuView.h
//  shuipingcaidan
//
//  Created by iOS developer on 16/8/31.
//  Copyright © 2016年 iOS developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalMenuProtocol <NSObject>

@optional
@required

-(void)getTag:(NSInteger )tag; //获取当前选中的下表

@end




@interface HorizontalMenuView : UIView
{
    NSArray *_menuArray;//获取到的菜单数量
    
}

-(void)setNameWithArray:(NSArray *)menuArray;//设置菜单的方法


@property(nonatomic,assign)id<HorizontalMenuProtocol>myDelagate;
@end
