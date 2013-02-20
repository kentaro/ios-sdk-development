//
//  PRPRecipesListDataSource.h
//  Recipe
//
//  Created by usr0600239 on 2012/10/31.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRPRecipe;

@protocol PRPRecipesListDataSource <NSObject>

- (NSInteger)recipeCount;
- (PRPRecipe *)recipeAtIndex:(NSInteger)index;
- (void)deleteRecipeAtIndex:(NSInteger)index;
- (PRPRecipe *)createNewRecipe;
- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe;

@end
