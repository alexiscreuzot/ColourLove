//
//  PaletteCell.m
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "PaletteCell.h"

@implementation PaletteCell{
    BOOL statusSelected;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PaletteCell" owner:self options:nil];
        self = nib[0];
        statusSelected = NO;
    }
    return self;
}

- (void) displayForPalette:(Palette *) palette
{
    statusSelected = palette.selected;
    [self.titleLabel setText:palette.title];
    [self.subtitleLabel setText:palette.userName];
    [self.paletteImage setImageWithURL:[NSURL URLWithString:palette.imageUrl]];
    [self setPaletteDisplayed:statusSelected animated:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    // Remove the behavior of the superclass
    // by not calling [super setSelected]
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    // Remove the behavior of the superclass
    // by not calling [super setSelected]
}

- (void) setPaletteDisplayed:(BOOL) displayed animated:(BOOL) animated
{
    [UIView beginAnimations:nil context:nil];
    if(animated){
        [UIView setAnimationDuration:0.3f];
    }else{
        [UIView setAnimationDuration:0.];
    }
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    CGRect frame = self.paletteImage.frame;
    if(displayed){
        frame.origin.x = 0;
        frame.size.width = 320;
        self.paletteImage.frame = frame;
        
    }else{
        frame.origin.x = 220;
        frame.size.width = 100;
        self.paletteImage.frame = frame;
    }
    [UIView commitAnimations];
}

@end
