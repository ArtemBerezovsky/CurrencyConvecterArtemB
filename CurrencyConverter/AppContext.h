//
//  AppContext.h
//  CurrencyConverter
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ApiConfig;
@class ApiManager;
@class CurrencyManager;
@class ApiHelper;


@interface AppContext : NSObject

@property (strong, nonatomic) ApiConfig *config;
@property (strong, nonatomic) ApiHelper *apiHelper;
@property (strong, nonatomic) CurrencyManager *Manager;
@property (strong, nonatomic) NSString *apiMethod;

+(AppContext *) sharedAppContext;


@end
