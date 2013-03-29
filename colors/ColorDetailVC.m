//
//  ColorDetailVC.m
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

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

- (id) initWithColor:(Color *) c{
    if(self = [super init]){
        _color = c;
    }
    return  self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_colorView setBackgroundColor:_color.rgbColor];
    [_hexLabel setText:[NSString stringWithFormat:@"#%@",_color.hexString]];
    [_hexLabel setTextColor:_color.contrastColor];
    [_titleLabel setText:_color.title];
    [_subtitleLabel setText:_color.userName];
    
    [_userButton setBackgroundColor:_color.rgbColor];
    [_userButton setTitleColor:_color.contrastColor forState:UIControlStateNormal];
    [_userButton setTitleColor:_color.contrastColor forState:UIControlStateNormal];
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
                
                user = [[User newRecord] initWithDict:[operation.responseString JSONValue][0]];
                [user save];
                [SVProgressHUD dismiss];
                
                UserDetailVC * detailController = [LayoutManager loadController:[UserDetailVC class]];
                detailController.user = user;
                [self.navigationController pushViewController:detailController animated:YES];
                
            }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }];
}

#pragma mark - User Interactions methods

- (IBAction) selectUserInfos
{
    user = [[[[User lazyFetcher] whereField:@"userName" equalToValue:_color.userName] fetchRecords] first];
    if(user){
        UserDetailVC * detailController = [LayoutManager loadController:[UserDetailVC class]];
        detailController.user = user;
        [self.navigationController pushViewController:detailController animated:YES];
    }else{
        [self requestUserInfos];
    }
}

@end
