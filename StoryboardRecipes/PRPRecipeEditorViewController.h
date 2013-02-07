//
//  PRPRecipeEditorViewController.h
//  StoryboardRecipes
//
//  Created by usr0600239 on 2013/01/17.
//  Copyright (c) 2013年 kentarok.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPRecipe;
@interface PRPRecipeEditorViewController : UIViewController
<UITextFieldDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) NSNumberFormatter *formatter;
@property(nonatomic, strong) IBOutlet UITextField *titleField;
@property(nonatomic, strong) IBOutlet UITextView *directionsText;
@property(nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property(nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property(nonatomic, strong) IBOutlet UIStepper *prepTimeStepper;

- (IBAction)changePreparationTime:(UIStepper *)sender;
@end
