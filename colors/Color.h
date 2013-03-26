//
//  Color.h
//  colors
//
//  Created by Alex on 25/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

@interface Color : NSObject
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * description;
@property (strong,nonatomic) NSString * hexString;
@property (strong,nonatomic) UIColor * rgbColor;
@property (strong,nonatomic) UIColor * inversedColor;

- (id) initWithDict:(NSDictionary *) dict;

@end
