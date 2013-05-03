//
//  UserDetailVC.m
//  colors
//
//  Created by Alex on 28/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "UserDetailVC.h"
#import "User.h"

@interface UserDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorNumberLabel;
@end

@implementation UserDetailVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    [_nameLabel setText:_user.userName];
    [_locationLabel setText:_user.location];
    [_ratingLabel setText:[_user.rating stringValue]];
    [_colorNumberLabel setText:[_user.numColors stringValue]];
}


@end
