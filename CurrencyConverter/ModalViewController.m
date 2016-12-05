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
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

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

- (IBAction)backButtonClicked:(id)sender
{
    [self.delegate comeBackHystory];
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
