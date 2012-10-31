//
//  PRPAppDelegate.h
//  Recipe
//
//  Created by usr0600239 on 2012/10/18.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListViewController.h"

@class PRPViewController;

@interface PRPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PRPRecipesListViewController *viewController;

@end
