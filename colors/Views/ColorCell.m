//
//  ColorCell.m
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
    // Remove default behavior
    // by not calling [super setHighlighted]
}

// Animate background color change
- (void) colorBackground:(BOOL) doColor
{
    [UIView animateWithDuration:.3f animations:^{
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
    }];
}

@end
