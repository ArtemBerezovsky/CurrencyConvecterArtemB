//
//  DataSource.h
//  CurrencyConverter
//
//  Created by ENGLISH on 11/13/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrencyManager.h"

@class CurrencyModel;

@interface DataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readonly) CurrencyModel *selectedCurrencyCurrencyModel;

- (instancetype)initWithCurrencyManager:(CurrencyManager *)aManager;

- (instancetype)init NS_UNAVAILABLE;

@end
