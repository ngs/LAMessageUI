//
//  LAMessageComposeViewController.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import "LAMessageComposeViewController.h"
#import "LAMessageComposeRootViewController.h"
#import "APTokenField.h"
#import "LAMessageComposeView.h"

@interface LAMessageComposeViewController ()

@property (nonatomic, strong) LAMessageComposeRootViewController *rootViewController;

@end

@implementation LAMessageComposeViewController

- (UIModalPresentationStyle)modalPresentationStyle {
  UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
  if(idiom == UIUserInterfaceIdiomPad)
    return UIModalPresentationFormSheet;
  return UIModalPresentationCurrentContext;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.rootViewController = [[LAMessageComposeRootViewController alloc] initWithMessageComposeController:self];
  [self setViewControllers:@[self.rootViewController]];
}

- (void)setBody:(NSString *)body {
  self.rootViewController.composeView.textView.text = body;
}

- (void)setRecipments:(NSArray *)recipments {
  if(!recipments)
    recipments = @[];
  self.rootViewController.composeView.recipientField.tokens = recipments.mutableCopy;
}

- (NSString *)body {
  return self.rootViewController.composeView.textView.text;
}

- (NSArray *)recipments {
  return self.rootViewController.composeView.recipientField.tokens.copy;
}

@end
