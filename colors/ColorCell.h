//
//  ColorCell.h
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Color.h"

@interface ColorCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel * titleLabel;
@property (strong,nonatomic) IBOutlet UILabel * subtitleLabel;
@property (strong,nonatomic) IBOutlet UIView * colorView;
@property (strong,nonatomic) Color * color;
@end
