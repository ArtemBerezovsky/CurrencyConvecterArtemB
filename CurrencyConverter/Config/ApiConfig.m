//
//  ApiConfig.m
//  CurrencyConverter
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "ApiConfig.h"
#import "CurrencyModel.h"

@implementation ApiConfig
{
    NSString *code;
    NSString *name;
}

- (instancetype)initWithConfigName: (NSString *)configName
{
    assert(nil != configName);
    assert(NO == [configName isEqualToString: @""]);
    
    self = [super init];
    
    [self loadConfig: configName];
    
    return self;
}

- (void)loadConfig: (NSString *)configName
{
    NSString *localConfigPath = [[NSBundle mainBundle] pathForResource: configName.stringByDeletingPathExtension
                                                                ofType: configName.pathExtension];
    NSDictionary *contents = [NSDictionary dictionaryWithContentsOfFile: localConfigPath];
    assert(nil != contents);
    _BaseURL = [NSURL URLWithString: contents[NSStringFromSelector(@selector(BaseURL))]];
    _queryItemsBase = contents[NSStringFromSelector(@selector(queryItemsBase))];
    _latestMethod = contents [NSStringFromSelector(@selector(latestMethod))];
    _symbolsMethod = contents [NSStringFromSelector(@selector(symbolsMethod))];
    code = contents [NSStringFromSelector(@selector(codeBaseCurrency))];
    name = contents [NSStringFromSelector(@selector(nameBaseCurrency))];
    _baseCurrency = [[CurrencyModel alloc]initWithCode:code
                                                  name:name];
    
}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
