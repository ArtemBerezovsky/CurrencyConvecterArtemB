//
//  RootWindow.h
//  CurrencyConverter
//
//  Created by ENGLISH on 11/17/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@class AppContext;

@interface RootWindow : NSObject

@property (nonatomic) UIWindow *root;
@property (strong, nonatomic, readonly) AppContext *AppContext;

- (instancetype)initWithConfig: (NSString *) configName;

@end
