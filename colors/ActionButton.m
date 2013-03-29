//
//  ActionButton.m
//
//  Created by Alexis Creuzot on 02/10/12.
//  Copyright (c) 2012 Alexis Creuzot. All rights reserved.
//

#import "ActionButton.h"

@implementation ActionButton

// In case we want to use it from the code
- (ActionButton *) initWithTitle:(NSString *) title
{
    if(self = [super init]){
        [self setTitle:title forState:UIControlStateNormal];
        [self setup];
    }
    return self;
}

// In case we want to use it directly from a .xib
- (void)awakeFromNib
{
    [self setup];
}

- (void) setup
{
    UIImage * backImg = [[UIImage imageNamed:@"button"] stretchableImageWithLeftCapWidth:5 topCapHeight:20];
    UIImage * backPressedImg = [[UIImage imageNamed:@"button_pressed"] stretchableImageWithLeftCapWidth:5 topCapHeight:20];
    
    [self setBackgroundImage:backImg forState:UIControlStateNormal];
    [self setBackgroundImage:backPressedImg forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.titleLabel.font = [UIFont systemFontOfSize:16];
}

@end
