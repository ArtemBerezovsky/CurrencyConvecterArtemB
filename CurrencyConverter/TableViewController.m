//
//  TableViewController.m
//  CurrencyConverter
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "TableViewController.h"
#import "MyTableViewControllerProtocol.h"

@interface TableViewController ()

@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, weak) NSNumber *selectedCurrencyNumber;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Select Currency";
    self.selectedCurrencyNumber = 0;
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [self initNavigationItemRightBarButtonItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - myMetods


- (void) initNavigationItemRightBarButtonItem
{
    self.doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done"
                                                       style: UIBarButtonItemStyleDone
                                                      target: self
                                                      action: @selector (doneButtonClicked)];
    self.navigationItem.rightBarButtonItem = self.doneButton;
}

- (void) doneButtonClicked
{
    [self.delegate CloseVC];
    [self.delegate didChangeCurrency: self.selectedCurrencyNumber];
    
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
