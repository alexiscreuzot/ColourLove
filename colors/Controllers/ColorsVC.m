//
//  ViewController.m
//  colors
//
// Copyright 2013 Alexis Creuzot
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "ColorsVC.h"
#import "ColorDetailVC.h"

#import "Color.h"
#import "ColorCell.h"
#import "Constants.h"

@interface ColorsVC ()
@property (weak, nonatomic) IBOutlet UITableView *colorsTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

static NSString * CellIdentifier = @"ColorCell";

@implementation ColorsVC

- (void)viewDidLoad {
	[super viewDidLoad];
    self.title = @"Colors";
	[self.searchBar setText:@""];
    self.colorsTableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    [self.colorsTableView registerClass:[ColorCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
	// We check the database, and proceed to do a web request
	// if the database doesn't return any results
	if ([Color allObjects].count == 0) {
        [self requestColors];
	}else {
		[self.colorsTableView reloadData];
	}
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[self.colorsTableView deselectRowAtIndexPath:self.colorsTableView.indexPathForSelectedRow animated:YES];
}

#pragma mark - Networking

- (void)requestColors
{
	// Init client
	AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL_BASE]];
    
	// Launch progressHUD and request
	[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
	[client getPath:@"colors" parameters:@{@"format" : @"json",@"keywords" : _searchBar.text}
            success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];

	    // Refresh the data with the new values
	    [[RLMRealm defaultRealm] beginWriteTransaction];
	    [[RLMRealm defaultRealm] deleteObjects:[Color allObjects]];
	    for (NSDictionary *obj in JSON) {
	        [Color createOrUpdateInDefaultRealmWithObject:obj];
		}
	    [[RLMRealm defaultRealm] commitWriteTransaction];

	    [_colorsTableView reloadData];
	    [SVProgressHUD showSuccessWithStatus:@"Done"];
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
	}];
}

#pragma mark - TableView datasource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [Color allObjects].count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ColorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	[cell displayForColor:[Color allObjects][indexPath.row]];
	return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	ColorDetailVC *detailController = [ColorDetailVC new];
	detailController.color = [Color allObjects][indexPath.row];
	[self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - SearchBar methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[self requestColors];
	[self.searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[self.searchBar resignFirstResponder];
}

@end
