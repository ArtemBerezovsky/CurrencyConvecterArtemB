//
//  ModalViewController.m
//  CurrencyConverter
//
//  Created by Admin on 05/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "ModalViewController.h"
#import "HystoryCurrencyManager.h"

@interface ModalViewController ()

@property (nonatomic, strong) UIBarButtonItem *backButton;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initNavigationItemLeftBarButtonItem
{
    self.backButton = [[UIBarButtonItem alloc] initWithTitle: @"Назад"
                                                       style: UIBarButtonItemStyleDone
                                                      target: self
                                                      action: @selector (backButtonClicked)];
    self.navigationItem.rightBarButtonItem = self.backButton;
}

- (void) backButtonClicked
{
    [self.delegate comebac];
    
    
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
