//
//  PatternCell.m
//  colors
//
//  Created by Alex on 29/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "PatternCell.h"

@implementation PatternCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PatternCell" owner:self options:nil];
        self = nib[0];
    }
    return self;
}

@end
