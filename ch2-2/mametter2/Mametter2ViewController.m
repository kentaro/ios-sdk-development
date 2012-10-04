//
//  Mametter2ViewController.m
//  mametter2
//
//  Created by usr0600239 on 2012/09/25.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import "Mametter2ViewController.h"
#import <Social/Social.h>

@interface Mametter2ViewController ()

@end

@implementation Mametter2ViewController

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

- (IBAction)handleTweetButtonTapped:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *tweetVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetVC setInitialText: @"I just finished the first project in iOS SDK Development. #pragsios"];
        [self presentViewController:tweetVC animated:YES completion:NULL];
    }
    else {
        NSLog (@"Can't send tweet");
    }
}

- (IBAction)handleShowMyTweetsTapped:(id)sender {
    [self.twitterWebView loadRequest:
    [NSURLRequest requestWithURL:
    [NSURL URLWithString:@"http://www.twitter.com/kentaro"]]];
}
@end
