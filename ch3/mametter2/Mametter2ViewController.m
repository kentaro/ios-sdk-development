//
//  Mametter2ViewController.m
//  mametter2
//
//  Created by usr0600239 on 2012/09/25.
//  Copyright (c) 2012年 kentarok.org. All rights reserved.
//

#import "Mametter2ViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface Mametter2ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *twitterTextView;
@property (strong) ACAccountStore *accountStore;
@property (readonly, strong) ACAccount *twitterAccount;

- (void) reloadTweets;
- (void) handleTwitterData: (NSData *) data
               urlResponse: (NSHTTPURLResponse *) urlResponse
                     error: (NSError *) error;
@end

@implementation Mametter2ViewController

@synthesize twitterAccount = _twitterAccount;

- (ACAccount*) twitterAccount {
    if (!_twitterAccount) {
        self.accountStore = [[ACAccountStore alloc] init];
        ACAccountType *twitterAccountType = [self.accountStore accountTypeWithAccountTypeIdentifier:                                                                      ACAccountTypeIdentifierTwitter];
        NSArray *twitterAccounts = [self.accountStore accountsWithAccountType:twitterAccountType];
        if ([twitterAccounts count] > 0) {
            _twitterAccount = [twitterAccounts objectAtIndex:0];
        }
    }

    return _twitterAccount;
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

- (IBAction)handleTweetButtonTapped:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *tweetVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetVC setInitialText: @"I just finished the first project in iOS SDK Development. #pragsios"];
        tweetVC.completionHandler = ^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                [self dismissViewControllerAnimated:YES completion:NULL];
                [self reloadTweets];
            }
        };
        [self presentViewController:tweetVC animated:YES completion:NULL];
    }
    else {
        NSLog (@"Can't send tweet");
    }
}

- (IBAction)handleShowMyTweetsTapped:(id)sender {
    [self reloadTweets];
}

- (void) reloadTweets {
    NSURL *twitterAPIURL = [NSURL URLWithString:
                            @"http://api.twitter.com/1/statuses/user_timeline.json"];
    NSDictionary *twitterParams = @{};
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodGET
                                                      URL:twitterAPIURL
                                               parameters:twitterParams];
    request.account = self.twitterAccount;
    [request performRequestWithHandler:^(NSData *responseData,
                                         NSHTTPURLResponse *urlResponse,
                                         NSError *error) {
        [self handleTwitterData:responseData
                    urlResponse:urlResponse
                          error:error];
    }];
}

- (void) handleTwitterData:(NSData *)data urlResponse:(NSHTTPURLResponse *)urlResponse error:(NSError *)error {
    NSError *jsonError = nil;
    NSJSONSerialization *jsonResponse =
    [NSJSONSerialization JSONObjectWithData:data
                                    options:0
                                      error:&jsonError];
    if (!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
        
        // ブロックの中でself.twitterTextView参照してるからweakで変数作っとくほうがいい?
        // http://www.zero4racer.com/blog/818
        __weak Mametter2ViewController * _self = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            _self.twitterTextView.text = @"";

            NSArray *tweets = (NSArray*) jsonResponse;
            NSSortDescriptor *sortByText =
            [NSSortDescriptor sortDescriptorWithKey:@"text" ascending:YES]; NSArray *sortDescriptors = @[sortByText];
            tweets = [tweets sortedArrayUsingDescriptors:sortDescriptors];

            for (NSDictionary *tweetDict in tweets) {
                NSString *tweetText = [NSString stringWithFormat:@"%@: %@ (%@)", [tweetDict valueForKeyPath:@"user.name"], [tweetDict valueForKey:@"text"], [tweetDict valueForKey:@"created_at"]];
                _self.twitterTextView.text = [NSString stringWithFormat:@"%@%@\n\n", self.twitterTextView.text,
                                             tweetText];
            }
        });
    }
}

@end
