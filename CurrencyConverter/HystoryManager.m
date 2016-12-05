//
//  HystoryManager.m
//  CurrencyConverter
//
//  Created by Admin on 04/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "HystoryManager.h"

static NSString *const day1 = @"2016-11-1";
static NSString *const day2 = @"2016-11-2";
static NSString *const day3 = @"2016-11-3";
static NSString *const day4 = @"2016-11-4";
static NSString *const day5 = @"2016-11-5";
static NSString *const day6 = @"2016-11-6";
static NSString *const day7 = @"2016-11-7";
static NSString *const day8 = @"2016-11-8";
static NSString *const day9 = @"2016-11-9";
static NSString *const day10 = @"2016-11-10";
static NSString *const day11 = @"2016-11-11";
static NSString *const day12 = @"2016-11-12";
static NSString *const day13 = @"2016-11-13";
static NSString *const day14 = @"2016-11-14";
static NSString *const day15 = @"2016-11-15";
static NSString *const day16 = @"2016-11-16";
static NSString *const day17 = @"2016-11-17";
static NSString *const day18 = @"2016-11-18";
static NSString *const day19 = @"2016-11-19";
static NSString *const day20 = @"2016-11-20";

@implementation HystoryManager


-(instancetype) init
{
    self = [super init];
    NSMutableArray *dayArray = [NSMutableArray arrayWithObjects:day1,day2,day3,day4,day5,day6,day7,day8,day9,day10,day11,day12,day13,day14,day15,day16,day17,day18,day19,day20, nil ];
    _dateArray = [dayArray copy];
    return self;
}

@end
