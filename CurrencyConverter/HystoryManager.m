//
//  HystoryManager.m
//  CurrencyConverter
//
//  Created by Admin on 04/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "HystoryManager.h"

static NSString *const day1 = @"1.11.2016";
static NSString *const day2 = @"2.11.2016";
static NSString *const day3 = @"3.11.2016";
static NSString *const day4 = @"4.11.2016";
static NSString *const day5 = @"5.11.2016";
static NSString *const day6 = @"6.11.2016";
static NSString *const day7 = @"7.11.2016";
static NSString *const day8 = @"8.11.2016";
static NSString *const day9 = @"9.11.2016";
static NSString *const day10 = @"10.11.2016";
static NSString *const day11 = @"11.11.2016";
static NSString *const day12 = @"12.11.2016";
static NSString *const day13 = @"13.11.2016";
static NSString *const day14 = @"14.11.2016";
static NSString *const day15 = @"15.11.2016";
static NSString *const day16 = @"16.11.2016";
static NSString *const day17 = @"17.11.2016";
static NSString *const day18 = @"18.11.2016";
static NSString *const day19 = @"19.11.2016";
static NSString *const day20 = @"20.11.2016";

@implementation HystoryManager


-(instancetype) init
{
    self = [super init];
    NSMutableArray *dayArray = [NSMutableArray arrayWithObjects:day1,day2,day3,day4,day5,day6,day7,day8,day9,day10,day11,day12,day13,day14,day15,day16,day17,day18,day19,day20, nil ];
    _dateArray = [dayArray copy];
    return self;
}

@end
