//
//  MyUITextField.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/4/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "MyUITextField.h"

@implementation MyUITextField

-(BOOL) canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(paste:))
        return NO;
    if (action == @selector(select:))
        return NO;
    if (action == @selector(selectAll:))
        return NO;
    return [super canPerformAction:action withSender:sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
