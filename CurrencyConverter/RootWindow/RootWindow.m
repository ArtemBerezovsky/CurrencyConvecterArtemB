//
//  RootWindow.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/17/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "RootWindow.h"
#import "CurrencyViewController.h"
#import "AppContext.h"
#import "ApiConfig.h"
#import "CurrencyManager.h"
#import "ApiHelper.h"

@implementation RootWindow

- (instancetype)init
{
    assert(NO);
    return nil;
}

- (instancetype)initWithConfig: (NSString *) configName
{
    self = [super init];
    [AppContext sharedAppContext].config = [[ApiConfig alloc]initWithConfigName:configName];
    [AppContext sharedAppContext].Manager = [[CurrencyManager alloc] init];
    [AppContext sharedAppContext].apiHelper = [[ApiHelper alloc] init]
    [self createWindow];
    return self;
}



- (void) createWindow
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CurrencyViewController *mainVC = [[CurrencyViewController alloc] initWithNibName: nil bundle: nil];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    navigationController.navigationBar.translucent = NO;
    
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    self.root = window;
}


@end
