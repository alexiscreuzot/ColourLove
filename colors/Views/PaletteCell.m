//
//  PaletteCell.m
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
    // Remove default behavior
    // by not calling [super setSelected]
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    // Remove default behavior
    // by not calling [super setHighlighted]
}

- (void) setPaletteDisplayed:(BOOL) displayed animated:(BOOL) animated
{
    float duration;
    if(animated){
        duration = .3f;
    }else{
        duration = 0;
    }
    
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        CGRect frame = self.paletteImage.frame;
        if(displayed){
            frame.origin.x = 0;
            frame.size.width = 320;            
        }else{
            frame.origin.x = 220;
            frame.size.width = 100;
        }
        self.paletteImage.frame = frame;
    }];
}

@end
