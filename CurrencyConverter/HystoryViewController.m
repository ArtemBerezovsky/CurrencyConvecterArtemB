//
//  HstoryViewController.m
//  CurrencyConverter
//
//  Created by Admin on 04/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "HystoryViewController.h"
#import "HystoryManager.h"
#import "HystoryDataSource.h"
#import "MyTableViewControllerProtocol.h"
#import "ModalViewController.h"





@interface HystoryViewController () <MyTableViewControllerProtocol>

@property (strong, nonatomic) HystoryDataSource *hystoryDataSourceProperty;
@property (weak, nonatomic) IBOutlet UITableView *Hystorytableview;
@property (nonatomic, strong) UIBarButtonItem *doneHystoryButton;

@end

@implementation HystoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"История курсов валют";
    HystoryManager *hystoryManager = [[HystoryManager alloc]init];
    HystoryDataSource *hystoryDataSource = [[HystoryDataSource alloc]initWithHystoryManager:hystoryManager];
    self.hystoryDataSourceProperty = hystoryDataSource;
    self.Hystorytableview.dataSource = self.hystoryDataSourceProperty;
    self.Hystorytableview.delegate = self.hystoryDataSourceProperty;

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) comeBackHystory
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

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
