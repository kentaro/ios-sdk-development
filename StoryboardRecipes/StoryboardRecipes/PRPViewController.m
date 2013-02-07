//
//  PRPViewController.m
//  Recipe
//
//  Created by usr0600239 on 2012/10/18.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import "PRPViewController.h"

@interface PRPViewController ()

@end

@implementation PRPViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.recipe.title;
    self.directionsView.text = self.recipe.directions;
    self.prepTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
    if (self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
