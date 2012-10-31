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
    self.recipeTitle.text = self.recipe.title;
    self.directionsView.text = self.recipe.directions;
    if (self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
