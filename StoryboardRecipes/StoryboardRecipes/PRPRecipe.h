//
//  PRPRecipe.h
//  Recipe
//
//  Created by usr0600239 on 2012/10/18.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRPRecipe : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *directions;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSNumber *preparationTime;

@end
