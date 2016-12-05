//
//  CurrencyViewController.m
//  CurrencyConverter
//
//  Created by ENGLISH on 10/30/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "CurrencyViewController.h"
#import "MyTableViewControllerProtocol.h"
#import "AppContext.h"
#import "ApiHelper.h"

#pragma mark - constants




static NSString *kValueDefault = @"0";
static NSString *const valueForTransferRate = @"1";
static NSString *const kUSDCode = @"USD";


@interface CurrencyViewController () <UITextFieldDelegate, MyTableViewControllerProtocol >

@property (weak, nonatomic) IBOutlet UILabel *leftCurrency;
@property (weak, nonatomic) IBOutlet UILabel *rightCurrency;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (assign, nonatomic) BOOL lastDot;
@property (assign, nonatomic) BOOL rubIsLeft;
@property (weak, nonatomic) IBOutlet UILabel *exchangeRateLabel;

@end

@implementation CurrencyViewController
{
    NSNumber *exchangeRate;
    NSDecimalNumber *rateDecimal;
    NSDecimalNumber *resultDecimal;
    NSDecimalNumberHandler *behavior;
    NSDecimalNumber *inputValueDecimal;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rubIsLeft = YES;
    self.title = @"Обмен Валюты";
    self.valueTextField.delegate = self;
    [self didChangeCurrency:kUSDCode];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction

-(IBAction)CurrencyTwo: (id)sender
{
    TableViewController *tablerate;
    tablerate = [[TableViewController alloc] initWithNibName: nil bundle: nil];
    tablerate.delegate = self;
    [self.navigationController pushViewController: tablerate animated: YES];
}

- (IBAction)hystoryButtonClicked:(id)sender {
    
    
    HystoryViewController *hystoryTable;
    hystoryTable = [[HystoryViewController alloc] initWithNibName: nil bundle: nil];
    _hystorytableProperty = hystoryTable;
    [self.navigationController pushViewController: hystoryTable animated: YES];
}





- (IBAction) changeButtonClicked: (UIButton *) sender
{
    self.rubIsLeft = !self.rubIsLeft;
    self.resultLabel.text = kValueDefault;
    if (self.rubIsLeft == YES)
    {
        self.leftCurrency.text = kRUB;
        self.rightCurrency.text = kUSD;
    }
    else
    {
        self.leftCurrency.text = kUSD;
        self.rightCurrency.text = kRUB;
    }
}

#pragma mark - myMetods

-(NSNumber *) conversion: (NSString *) inputText
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *currency = [formatter numberFromString: inputText];
    return currency;
}


- (void)updateRate:(NSDictionary *)dict
 selectedCurrency :(NSString *) selectedCurrency
{
    NSNumber *rate = dict[selectedCurrency];
    exchangeRate = rate;
    NSDecimalNumber *exchangeRateDecimal = [NSDecimalNumber decimalNumberWithDecimal:[exchangeRate decimalValue]];
    NSDecimalNumber *value = [NSDecimalNumber decimalNumberWithString:valueForTransferRate];
    behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                              scale:2
                                                                                   raiseOnExactness:NO
                                                                                    raiseOnOverflow:NO
                                                                                   raiseOnUnderflow:NO
                                                                                raiseOnDivideByZero:NO];
    rateDecimal = [value decimalNumberByDividingBy:exchangeRateDecimal];
    NSDecimalNumber *rateDecimalScale2 = [value decimalNumberByDividingBy:exchangeRateDecimal
                                                       withBehavior:behavior];
    dispatch_async(dispatch_get_main_queue(), ^{
        _exchangeRateLabel.text = [NSString stringWithFormat:@"Курс за 1 %@ составляет %@₽", selectedCurrency, rateDecimalScale2];
        [self.view setNeedsDisplay];

    });
    [self calculate];
}


    
- (void)handleError:(NSError *)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleCancel handler:NULL]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}



- (void) calculate

{
    if (self.rubIsLeft == YES)
    {
        
        resultDecimal = [inputValueDecimal decimalNumberByDividingBy:rateDecimal
                                                        withBehavior:behavior];
        
    }
    else
    {
        resultDecimal = [inputValueDecimal decimalNumberByMultiplyingBy:rateDecimal
                                                           withBehavior:behavior];
        
    }
    self.resultLabel.text = [resultDecimal stringValue];
    
}




#pragma mark - MyTableViewControllerProtocol

- (void) didChangeCurrency: (NSString *) selectedCurrency
{
    [self.navigationController popViewControllerAnimated: YES];
    self.rightCurrency.text = selectedCurrency;
    typeof(self) __weak weakSelf = self;
    
    
    [ [AppContext sharedAppContext].apiHelper  loadAllRatesWithResponseHandler: ^(NSDictionary * _Nonnull dict)
     {
         [weakSelf updateRate:dict
             selectedCurrency: selectedCurrency];
     }
                                                            withFailureHandler: ^(NSError * _Nonnull error)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             [weakSelf handleError:error];
         });
     }];
    
    
    
}





#pragma mark - delegateMetods

- (BOOL) textField: (UITextField *)textField
shouldChangeCharactersInRange: (NSRange)range
            replacementString: (NSString *)string
{
    if([textField.text length] > 0)
    {
        NSString *lastCharacter = [textField.text substringFromIndex:[textField.text length]-1];
        if ([string isEqualToString: @""])
        {
            if ([lastCharacter isEqualToString: @"."])
            {
                self.lastDot = NO;
                NSNumber *inputValue = [self conversion: [textField.text substringToIndex: [textField.text length]]];
                inputValueDecimal = [NSDecimalNumber decimalNumberWithDecimal:[inputValue decimalValue]];
                [self calculate];
            }
        }
        if ([string isEqualToString: @"."])
        {
            if(self.lastDot == NO)
            {
                self.lastDot = YES;
            
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
  
    if ([textField.text isEqualToString: @""] || [textField.text length] > 0)
    {
        NSNumber *inputValue = [self conversion: [textField.text stringByAppendingString:string]];
        inputValueDecimal = [NSDecimalNumber decimalNumberWithDecimal:[inputValue decimalValue]];
        [self calculate];
    }
     return YES;
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
