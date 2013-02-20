//
//  PRPRecipeEditorViewController.m
//  StoryboardRecipes
//
//  Created by usr0600239 on 2013/01/17.
//  Copyright (c) 2013年 kentarok.org. All rights reserved.
//

#import "PRPRecipeEditorViewController.h"
#import "PRPDirectionsEditorViewController.h"
#import "PRPRecipe.h"

@implementation PRPRecipeEditorViewController
- (IBAction)changePreparationTime:(UIStepper *)sender {
    NSInteger value = (NSInteger)[sender value];
    self.recipe.preparationTime = [NSNumber numberWithInteger:value];
    self.prepTimeLabel.text =
    [self.formatter stringFromNumber:self.recipe.preparationTime];
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.formatter = [[NSNumberFormatter alloc] init];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleField.text = self.recipe.title;
    self.directionsText.text = self.recipe.directions;
    self.prepTimeLabel.text = [self.formatter
                               stringFromNumber:self.recipe.preparationTime];
    self.prepTimeStepper.value = [self.recipe.preparationTime doubleValue];
    if(nil != self.recipe.image) {
        self.recipeImage.image = self.recipe.image;
    }
}

#pragma mark - Text Field Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.recipe.title = textField.text;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([@"editDirections" isEqualToString:segue.identifier]) {
        PRPDirectionsEditorViewController *vc = (PRPDirectionsEditorViewController *)[segue destinationViewController];

        [vc setRecipe:self.recipe];
    }
    if([@"choosePhoto" isEqualToString:segue.identifier]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.recipe.image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.recipeImage.image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES
                             completion:NULL];
    [self.recipeListVC finishedEditingRecipe:self.recipe];
}

@end
