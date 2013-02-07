//
//  PRPViewController.h
//  Recipe
//
//  Created by usr0600239 on 2012/10/18.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipe.h"

@interface PRPViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *directionsView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic, strong) IBOutlet UILabel *prepTime;
@property(nonatomic, strong) NSNumberFormatter *formatter;

@property (strong, nonatomic) PRPRecipe *recipe;

@end
