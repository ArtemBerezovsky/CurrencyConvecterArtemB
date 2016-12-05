//
//  ApiHelper.h
//  CurrencyConverter
//
//  Created by Admin on 29/11/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ApiConfig;

NS_ASSUME_NONNULL_BEGIN
@interface ApiHelper : NSObject


@property (nonatomic,nullable, copy) void (^failureHandler)(NSError *error);

- (void) loadAllRatesWithResponseHandler: (void (^)( NSDictionary *dict))responseHandler
                      withFailureHandler: (void (^)( NSError *error))failureHandler;

- (void) loadAllRatesDateWithResponseHandler: (void (^)( NSDictionary *dict))responseHandler
                          withFailureHandler: (void (^)( NSError *error))failureHandler
                                    withDate: (NSString *) selectedDate;


NS_ASSUME_NONNULL_END

@end
