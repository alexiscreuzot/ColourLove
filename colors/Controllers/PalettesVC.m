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

@implementation PalettesVC{
    NSMutableArray * palettes;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_searchBar setText:@""];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    // Check if palettes is nil, we need to refresh data if it's the case
    // We then check the database, and only proceed to do a web request
    // if the database doesn't return any results
    if(!palettes){
        if([Palette count] == 0){
            [self requestPalettes];
        }else{
            palettes = [Palette allRecords].mutableCopy;
            [_palettesTableView reloadData];
        }
    }else{
        [_palettesTableView deselectRowAtIndexPath:_palettesTableView.indexPathForSelectedRow animated:YES];
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
                
                // Refresh the data with the new values
                [Palette dropAllRecords];
                palettes = [NSMutableArray array];
                
                for(NSDictionary * palDict in [operation.responseString JSONValue]){
                    Palette * pal = [[Palette newRecord]initWithDict:palDict];
                    [pal save];
                    [palettes addObject:pal];
                }
                
                [_palettesTableView reloadData];
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
    static NSString * CellIdentifier = @"PaletteCell";
    PaletteCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[PaletteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Palette * currentPalette = palettes[indexPath.row];
    [cell displayForPalette:currentPalette];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaletteCell * cell =(PaletteCell *) [_palettesTableView cellForRowAtIndexPath:indexPath];
    Palette * selectedPalette = palettes[indexPath.row];
    selectedPalette.selected = ! selectedPalette.selected;
    [cell setPaletteDisplayed:selectedPalette.selected animated:YES];
}

#pragma mark - SearchBar methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self requestPalettes];
    [_searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
}

@end