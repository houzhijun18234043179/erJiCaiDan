//
//  ViewController.m
//  shuipingcaidan
//
//  Created by iOS developer on 16/8/31.
//  Copyright © 2016年 iOS developer. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalMenuView.h"
#import "ViewController0.h"
#import "ViewController2.h"
@interface ViewController ()<HorizontalMenuProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.title = @"水平菜单栏";
    
    HorizontalMenuView *menuView = [[HorizontalMenuView alloc]init];
    menuView.frame = CGRectMake(0, 64, self.view.frame.size.width, 45);
    menuView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:menuView];
    NSArray *array = [NSArray arrayWithObjects:@"资讯",@"曝光台",@"警务公开", nil];
    [menuView setNameWithArray:array];
    menuView.myDelagate = self;
}

-(void)getTag:(NSInteger)tag{
    
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",tag];
    NSLog(@"菜单%ld",tag);
    
    if (tag == 0) {
        NSLog(@"1");
        self.navigationItem.title = @"资讯";
        ViewController0 * view0 =[[ViewController0 alloc]init];
//        [self presentViewController:view0 animated:YES completion:^{
//            
//            
//        }];
        
//        [self.navigationController pushViewController:view0 animated:YES];
    }else{
        NSLog(@"2");
        self.navigationItem.title = @"保管太";
//        UITableView *tab =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
//        tab.backgroundColor = [UIColor cyanColor];
//        [self.view addSubview:tab];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
