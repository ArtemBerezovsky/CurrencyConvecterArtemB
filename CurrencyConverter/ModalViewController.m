//
//  ModalViewController.m
//  CurrencyConverter
//
//  Created by Admin on 05/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "ModalViewController.h"
#import "HystoryCurrencyManager.h"
#import "ApiHelper.h"
#import "AppContext.h"

@interface ModalViewController ()

@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = self.selectedDateProperty;
    [[AppContext sharedAppContext].apiHelper loadAllRatesDateWithResponseHandler:^(NSDictionary * _Nonnull dict) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.titleLabel.text = [NSString stringWithFormat:@" %@ ", dict];
            [self.view setNeedsDisplay];
            
        });

    }
                                                              withFailureHandler:^(NSError * _Nonnull error) {
                                                                  self.titleLabel.text = [NSString stringWithFormat:@"Ошибка загрузки"];
                                                              }
                                                                        withDate:self.selectedDateProperty];
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
