//
//  PRPRecipesSource.m
//  Recipe
//
//  Created by usr0600239 on 2012/10/31.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import "PRPRecipesSource.h"
#import "PRPRecipe.h"

@interface PRPRecipesSource()
@property (nonatomic, strong) NSMutableArray *recipes;
@end

@implementation PRPRecipesSource

- (NSArray *)recipes
{
    if (!_recipes) {
        NSMutableArray *localRecipes = [NSMutableArray array];
        PRPRecipe *recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"0 - Put some stuff in, and the other stuff, then stir"; recipe.title = @"0 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        recipe.preparationTime = @30;
        [localRecipes addObject:recipe];

        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"1 - Put some stuff in, and the other stuff, then stir"; recipe.title = @"1 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        recipe.preparationTime = @30;
        [localRecipes addObject:recipe];

        self.recipes = localRecipes;
    }
    
    return _recipes;
}

- (NSInteger)recipeCount
{
    return [self.recipes count];
}

- (PRPRecipe *)recipeAtIndex:(NSInteger)index
{
    return [self.recipes objectAtIndex:index];
}

- (void)deleteRecipeAtIndex:(NSInteger)index
{
    [self.recipes removeObjectAtIndex:index];
}

- (PRPRecipe *)createNewRecipe {
    PRPRecipe *recipe = [[PRPRecipe alloc] init];
    [self.recipes addObject:recipe];
    return recipe;
}

@end
