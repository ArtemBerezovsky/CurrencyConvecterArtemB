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


@property (weak, nonatomic) id <MyTableViewControllerProtocol> delegate;
@property (strong,nonatomic) NSString *selectedDateProperty;
@end
