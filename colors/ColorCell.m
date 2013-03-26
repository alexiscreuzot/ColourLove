//
//  ColorCell.m
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ColorCell.h"

@implementation ColorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ColorCell" owner:self options:nil];
        self = nib[0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [self colorBackground:selected];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [self colorBackground:highlighted];
}

// Animate background color change
- (void) colorBackground:(BOOL) doColor
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    if(doColor){
        self.backgroundColor = _color.rgbColor;
    }else{
        self.backgroundColor = [UIColor whiteColor];
    }
    [UIView commitAnimations];
}

@end
