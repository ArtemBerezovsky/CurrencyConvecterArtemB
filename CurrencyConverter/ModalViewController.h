//
//  ModalViewController.h
//  CurrencyConverter
//
//  Created by Admin on 05/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewControllerProtocol.h"

@interface ModalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@property (weak, nonatomic) id <MyTableViewControllerProtocol> delegate;

@end
