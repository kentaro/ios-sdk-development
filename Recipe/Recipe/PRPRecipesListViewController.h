//
//  PRPRecipesListViewController.h
//  Recipe
//
//  Created by usr0600239 on 2012/10/31.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListDataSource.h"

@interface PRPRecipesListViewController : UITableViewController

@property (strong, nonatomic) id <PRPRecipesListDataSource> dataSource;

@end
