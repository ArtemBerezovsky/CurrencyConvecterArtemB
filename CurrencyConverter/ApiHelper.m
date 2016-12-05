//
//  ApiHelper.m
//  CurrencyConverter
//
//  Created by Admin on 29/11/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "ApiHelper.h"
#import "ApiConfig.h"
#import "CurrencyModel.h"
#import "AppContext.h"
#import "CurrencyManager.h"
#import "CurrencyModel.h"
#import "CurrencyModel.h"


@implementation ApiHelper


{
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
    NSString *method;
    NSDictionary *requestParams;
   
}


- (instancetype) init
{
   self =  [super init];
    session = [NSURLSession sharedSession];
    return self;
}



- (void) loadAllRatesWithResponseHandler: (void (^)( NSDictionary *dict))responseHandler
                  withFailureHandler: (void (^)( NSError *error))failureHandler
{
    
    NSURL *requestURL = [self createURLForAllCurrencies];
    typeof(self) __weak weakSelf = self;
    dataTask = [session dataTaskWithURL:requestURL
                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                          [weakSelf processData:data
                                          error:error
                            withResponseHandler:responseHandler
                             withFailureHandler:failureHandler ];
                      }];
    
    [dataTask resume];
}

- (void) loadAllRatesDateWithResponseHandler: (void (^)( NSDictionary *dict))responseHandler
                      withFailureHandler: (void (^)( NSError *error))failureHandler
                                withDate: (NSString *) selectedDate
{
    NSString * codeBase = [AppContext sharedAppContext].config.baseCurrency.code;
    NSArray *currencies = [AppContext sharedAppContext].Manager.currencies;
    NSMutableArray *codeArray = [[NSMutableArray alloc] init];
    for (CurrencyModel *objectCurrency in currencies)
    {
        [codeArray addObject: objectCurrency.code];
    }
    
    NSURL *requestURL = [self createURLWithDate:selectedDate
                                    forCurrency:codeBase
                                 withCurrencies:codeArray];
    typeof(self) __weak weakSelf = self;
    dataTask = [session dataTaskWithURL:requestURL
                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                          [weakSelf processData:data
                                          error:error
                            withResponseHandler:responseHandler
                             withFailureHandler:failureHandler ];
                      }];
    
    [dataTask resume];
}





- (NSURL *) createURLForAllCurrencies
{
    return [self createURLWithDate: nil
                       forCurrency: [AppContext sharedAppContext].config.baseCurrency.code
                    withCurrencies: nil];
}

- (NSURL *) createURLWithBaseCurrency: (NSString *) baseCurrencyCode
                       withCurrencies: (NSArray *) currenciesCodes
{
    return [self createURLWithDate: nil
                       forCurrency: baseCurrencyCode
                    withCurrencies: currenciesCodes];
}

- (NSURL *) createURLWithDate: (NSString *) date
                  forCurrency: (NSString *) baseCurrencyCode
               withCurrencies: (NSArray *) currencyCodes
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL: [AppContext sharedAppContext].config.BaseURL
                                               resolvingAgainstBaseURL: NO];
    if (date == nil)
    {
        components.path = [AppContext sharedAppContext].config.latestMethod;
    }
    else
    {
        
        components.path = [@"/" stringByAppendingString: date];;
    }
    NSDictionary *params = nil;
    if (currencyCodes == nil)
    {
        params = @{[AppContext sharedAppContext].config.queryItemsBase : baseCurrencyCode};
    }
    else
    {
        NSString * result = [[currencyCodes valueForKey:@"description"] componentsJoinedByString:@","];
        params = @{[AppContext sharedAppContext].config.queryItemsBase : baseCurrencyCode,
                   [AppContext sharedAppContext].config.symbolsMethod : result};
    }
    requestParams = [params copy];
    if (requestParams != nil)
    {
        NSMutableArray *queryItems = [[NSMutableArray alloc] init];
        for (NSString *key in requestParams)
        {
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName: key
                                                               value: requestParams[key]];
            [queryItems addObject: item];
        }
        components.queryItems = queryItems;
    }
    return [components URL];
}





- (void)processData:(NSData *)data
              error:(NSError *)error
withResponseHandler: (void (^)( NSDictionary *dict))responseHandler
 withFailureHandler: (void (^)( NSError *error))failureHandler
{
    if( nil != error )
    {
        failureHandler(error);
        return;
    }
    
    if( nil != data )
    {
        NSError *error = nil;
        
        id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if( nil != error )
        {
            failureHandler(error);
            return;
        }
        
        responseHandler(response[@"rates"]);
    }
}




- (void)handleError:(NSError *)error
{
    if( NULL != _failureHandler )
    {
        _failureHandler(error);
    }
}



@end
