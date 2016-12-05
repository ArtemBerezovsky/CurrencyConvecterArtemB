//
//  HistoryDataSource.h
//  CurrencyConverter
//
//  Created by Admin on 04/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HystoryManager.h"

@interface HystoryDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readonly) NSString *selectedDate;


- (instancetype)initWithHystoryManager:(HystoryManager *)aHManager;


@end
