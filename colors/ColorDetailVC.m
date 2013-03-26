//
//  ColorDetailVC.m
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ColorDetailVC.h"

@interface ColorDetailVC ()
@property (strong, nonatomic) IBOutlet UIView * colorView;
@property (strong, nonatomic) IBOutlet UILabel * hexLabel;
@property (strong, nonatomic) IBOutlet UILabel * titleLabel;
@property (strong, nonatomic) IBOutlet UILabel * subtitleLabel;
@end

@implementation ColorDetailVC

- (id) initWithColor:(Color *) c{
    if(self = [super init]){
        _color = c;
    }
    return  self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_colorView setBackgroundColor:_color.rgbColor];
    [_hexLabel setText:_color.hexString];
    [_hexLabel setTextColor:_color.inversedColor];
    [_titleLabel setText:_color.title];
    [_subtitleLabel setText:_color.description];
}

@end
