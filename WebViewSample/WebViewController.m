//
//  WebViewController.m
//  WebViewSample
//
//  Created by minds on 13. 9. 9..
//  Copyright (c) 2013년 rhinesoft. All rights reserved.
//

#import "WebViewController.h"

@implementation PortraitNavigationController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

@end

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static inline UIBarButtonItem *BarButtonSystemItem(UIBarButtonSystemItem systemItem, id target, SEL selector)
{
    return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:selector] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    UINavigationItem *item = self.navigationItem;
    item.leftBarButtonItem = BarButtonSystemItem(UIBarButtonSystemItemStop, self, @selector(close:));

    self.webView = [[[UIWebView alloc] initWithFrame:[self.view bounds]] autorelease];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.websocket.org/echo.html"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close:(id)sender
{
    UIViewController *topViewController = self.navigationController.presentingViewController;
    [topViewController dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

@end
