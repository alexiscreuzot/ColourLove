//
//  ViewController.m
//  colors
//
//  Created by Alex on 28/11/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "ColorsVC.h"
#import "ColorDetailVC.h"
#import "Color.h"
#import "ColorCell.h"

@interface ColorsVC ()
@property (strong, nonatomic) IBOutlet UITableView * colorsTableView;
@end

@implementation ColorsVC{
    NSMutableArray * colors;
    NSMutableData * receivedData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    colors = [NSMutableArray array];
    receivedData = [NSMutableData data];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if([colors count] == 0){
        [self requestColors];
    }else{
        [_colorsTableView deselectRowAtIndexPath:_colorsTableView.indexPathForSelectedRow animated:YES];
    }
}

#pragma mark - Networking (Third parties)

- (void) requestColors
{
    // Init client
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL_BASE]];
    // Launch progressHUD and request
    [SVProgressHUD show];
    [client getPath:@"colors" parameters:@{@"format":@"json"}
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                for(NSDictionary * colorDict in [responseObject JSONValue]){
                    Color * col = [[Color alloc] initWithDict:colorDict];
                    [colors addObject:col];
                }
                [_colorsTableView reloadData];
                [SVProgressHUD showSuccessWithStatus:@"Done"];
                
            }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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
    static NSString * CellIdentifier = @"ColorCell";
    ColorCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[ColorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Color * currentColor = colors[indexPath.row];
    cell.color = currentColor;
    cell.titleLabel.text = currentColor.title;
    cell.subtitleLabel.text = currentColor.description;
    cell.colorView.backgroundColor = currentColor.rgbColor;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Color * selectedColor = colors[indexPath.row];
    ColorDetailVC * detailController = [[ColorDetailVC alloc] initWithColor:selectedColor];
    [self.navigationController pushViewController:detailController animated:YES];
}

@end
