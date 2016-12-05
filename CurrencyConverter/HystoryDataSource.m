//
//  HistoryDataSource.m
//  CurrencyConverter
//
//  Created by Admin on 04/12/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "HystoryDataSource.h"
#import "HystoryViewController.h"
#import "ModalViewController.h"

static NSString * identifier = @"HystoryCell";



@implementation HystoryDataSource

{
    HystoryManager *hManager;
    HystoryViewController *hystoryViewController;
    ModalViewController *modalViewController;
}

- (instancetype)initWithHystoryManager:(HystoryManager *)aHManager
{
    self = [super init];
    
    hManager = aHManager;
    
    return self;
}

#pragma mark - UItableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return hManager.dateArray.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: identifier];
    }
    cell.textLabel.text = hManager.dateArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //[self presentViewController: (UIViewController *) viewController
 //withCompletion: (void)(^)(void) completionHandler]
    _selectedDate =hManager.dateArray[indexPath.row];
    hystoryViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    modalViewController = [[ModalViewController alloc]initWithNibName:nil bundle:nil];
    [hystoryViewController presentViewController: modalViewController  animated: YES completion: nil];
    //modalViewController.titleLabel.text = _selectedDate;
}


- (instancetype)init
{
    assert( NO );
    return nil;
}






@end
