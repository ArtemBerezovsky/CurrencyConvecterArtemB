//
//  ApiConfig.h
//  CurrencyConverter
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CurrencyModel;

@interface ApiConfig : NSObject


@property (nonatomic, readonly) NSURL *BaseURL;
@property (nonatomic,readonly) NSString *codeBaseCurrency;
@property (nonatomic,readonly) NSString *nameBaseCurrency;
@property (nonatomic,readonly) CurrencyModel *baseCurrency;
@property (nonatomic,readonly) NSString *queryItemsBase;
@property (nonatomic,readonly) NSString *latestMethod;
@property (nonatomic,readonly) NSString *symbolsMethod;

- (instancetype)initWithConfigName:(NSString *)configName;

- (instancetype)init NS_UNAVAILABLE;


@end
