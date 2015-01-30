//
//  PalettesVC.m
//  palettes
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

#import "PalettesVC.h"
#import "Palette.h"
#import "PaletteCell.h"

@interface PalettesVC ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *palettesTableView;
@end

static NSString * CellIdentifier = @"PaletteCell";

@implementation PalettesVC{
    NSMutableArray * palettes; // Allow some caching
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Palettes";
    [_searchBar setText:@""];
    self.palettesTableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    [self.palettesTableView registerClass:[PaletteCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self populateTableView];
}

- (void) populateTableView
{
    // We check the database, and proceed to do a web request
    // if the database doesn't return any results
    if([Palette allObjects].count == 0){
        [self requestPalettes];
    }else{
        palettes = @[].mutableCopy;
        for(Palette * pal in [Palette allObjects]){
            [palettes addObject:pal];
        }
        [_palettesTableView reloadData];
    }
}

#pragma mark - Networking

- (void) requestPalettes
{
    // Init client
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL_BASE]];
    
    // Launch progressHUD and request
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [client getPath:@"palettes" parameters:@{@"format":@"json", @"keywords":_searchBar.text}
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSArray * result = [operation.responseString JSONValue];
                
                // Refresh the data with the new values
                [[RLMRealm defaultRealm] beginWriteTransaction];
                [[RLMRealm defaultRealm] deleteObjects:[Palette allObjects]];
                for(NSDictionary * obj in result){
                    [Palette createOrUpdateInDefaultRealmWithObject:obj];
                }
                [[RLMRealm defaultRealm] commitWriteTransaction];
                
                [self populateTableView];
                [SVProgressHUD showSuccessWithStatus:@"Done"];
                
            }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }];
}

#pragma mark - TableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [palettes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaletteCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Palette * currentPalette = palettes[indexPath.row];
    [cell displayForPalette:currentPalette];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaletteCell * cell = (PaletteCell *) [self.palettesTableView cellForRowAtIndexPath:indexPath];
    [cell toggleSelectedAnimated:YES];
}

#pragma mark - SearchBar methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self requestPalettes];
    [self.searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

@end