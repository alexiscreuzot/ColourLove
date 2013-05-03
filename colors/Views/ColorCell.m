//
//  ColorCell.m
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ColorCell.h"

@implementation ColorCell{
    Color * _color;
    BOOL animating;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ColorCell" owner:self options:nil];
        self = nib[0];
    }
    return self;
}

- (void) displayForColor:(Color *) color
{
    _color = color;
    [self.titleLabel setText:color.title];
    [self.subtitleLabel setText:[NSString stringWithFormat:@"#%@",color.hexString]];
    [self.colorView setBackgroundColor:color.rgbColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [self colorBackground:selected];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    //[self colorBackground:YES];
}

// Animate background color change
- (void) colorBackground:(BOOL) doColor
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    if(doColor){
        self.backgroundColor = _color.rgbColor;
        self.titleLabel.textColor = _color.contrastColor;
        self.subtitleLabel.textColor = _color.contrastColor;
    }else{
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.subtitleLabel.textColor = [UIColor lightGrayColor];
    }
    [UIView commitAnimations];
}

@end
