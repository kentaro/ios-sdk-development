//
//  PRPDirectionsEditorViewController.h
//  StoryboardRecipes
//
//  Created by usr0600239 on 2013/02/13.
//  Copyright (c) 2013年 kentarok.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController
<UITextViewDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) IBOutlet UITextView *textView;

@end
