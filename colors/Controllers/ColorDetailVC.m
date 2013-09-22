//
//  ColorDetailVC.m
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

#import "ColorDetailVC.h"
#import "UserDetailVC.h"
#import "User.h"

@interface ColorDetailVC ()
@property (weak, nonatomic) IBOutlet UIView * colorView;
@property (weak, nonatomic) IBOutlet UILabel * hexLabel;
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel * subtitleLabel;
@property (weak, nonatomic) IBOutlet UIButton * userButton;
@end

@implementation ColorDetailVC{
    User * user;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = _color.rgbColor;
    self.title = _color.title;
    
    [_hexLabel setText:[NSString stringWithFormat:@"#%@",_color.hexString]];
    [_hexLabel setTextColor:_color.contrastColor];
    
    [_userButton setTitle:_color.userName forState:UIControlStateNormal];
    [_userButton setTitleColor:_color.contrastColor forState:UIControlStateNormal];
    [_userButton.layer setCornerRadius:5];
    [_userButton.layer setBorderColor:_color.contrastColor.CGColor];
    [_userButton.layer setBorderWidth:1];
}

#pragma mark - Networking

- (void) requestUserInfos
{
    // Init client
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL_BASE]];
    NSString * uri = [NSString stringWithFormat:@"lover/%@", [_color.userName urlencode]];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [client getPath:uri parameters:@{@"format":@"json"}
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                // Dismiss loader
                [SVProgressHUD dismiss];
                
                // Save user in database
                user = [[User newRecord] initWithDict:[operation.responseString JSONValue][0]];
                [user save];
                
                // Load
                UserDetailVC * userController = [UserDetailVC new];
                userController.user = user;
                [self.navigationController pushViewController:userController animated:YES];
                
            }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }];
}

#pragma mark - User Interactions methods

- (IBAction) selectUserInfos
{
    user = [[[[User lazyFetcher] whereField:@"userName" equalToValue:_color.userName] fetchRecords] first];
    if(user){
        UserDetailVC * userController = [UserDetailVC new];
        userController.user = user;
        [self.navigationController pushViewController:userController animated:YES];
    }else{
        [self requestUserInfos];
    }
}

@end
