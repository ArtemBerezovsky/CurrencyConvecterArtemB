//
//  AppContext.m
//  CurrencyConverter
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "AppContext.h"
#import "ApiConfig.h"
#import "ApiHelper.h"
#import "CurrencyManager.h"
#import "ApiHelper.h"

static AppContext *_appContext = nil;

@implementation AppContext




+(AppContext* ) sharedAppContext
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _appContext = [[AppContext alloc] init];
    });
    return _appContext;
}




@end
