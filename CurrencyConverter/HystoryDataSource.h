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
#import "MyTableViewControllerProtocol.h"

@interface HystoryDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readonly) NSString *selectedDate;
@property (weak, nonatomic) id <MyTableViewControllerProtocol> delegate;

- (instancetype)initWithHystoryManager:(HystoryManager *)aHManager;


@end
