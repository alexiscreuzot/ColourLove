//
//  PaletteCell.h
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "PaletteCell.h"
#import "Palette.h"

@interface PaletteCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel * titleLabel;
@property (strong,nonatomic) IBOutlet UILabel * subtitleLabel;
@property (strong,nonatomic) IBOutlet UIImageView * paletteImage;
- (void) displayForPalette:(Palette *) palette;
- (void) setPaletteDisplayed:(BOOL) displayed animated:(BOOL) animated;
@end
