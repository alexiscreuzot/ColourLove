//
//  ViewController.m
//  colors
//
//  Created by Alex on 28/11/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "ColorsVC.h"

@interface ColorsVC ()
@property (strong, nonatomic) IBOutlet UITableView * colorsTableView;
@end

@implementation ColorsVC{
    NSArray * colors;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    // Proceed with request
    [self requestColors];
}

#pragma mark - Networking

- (void) requestColors
{
    // Init client
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL_BASE]];
    
    [SVProgressHUD show];
    [client getPath:@"colors" parameters:@{@"format":@"json"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        colors = [operation.responseString JSONValue];
        [_colorsTableView reloadData];
        [SVProgressHUD showSuccessWithStatus:@"Done"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

#pragma mark - TableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CountryCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary * currentColor = colors[indexPath.row];
    cell.textLabel.text = currentColor[@"title"];
    cell.detailTextLabel.text = currentColor[@"description"];
    
    return cell;
}


@end
