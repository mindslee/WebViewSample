//
//  PopupWebViewController.m
//  WebViewSample
//
//  Created by minds on 13. 9. 9..
//  Copyright (c) 2013년 rhinesoft. All rights reserved.
//

#import "PopupWebViewController.h"
#import "cocos2d.h"
#import <QuartzCore/QuartzCore.h>

@interface PopupWebViewController ()

@end

@implementation PopupWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    CCLOG(@"dealloc PopupWebViewController");
    
    [super dealloc];
}

- (void)loadView
{
    CGRect frameRect = [[[CCDirector sharedDirector] view] bounds];
    UIView *view = [[UIView alloc] initWithFrame:frameRect];
    view.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5f];

    CGRect viewBounds = view.bounds;
    UIWebView *webView = [[[UIWebView alloc] initWithFrame:CGRectInset(viewBounds, 20, 20)] autorelease];
    webView.layer.cornerRadius = 5;
    webView.layer.masksToBounds = YES;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.websocket.org/echo.html"]]];
    webView.scalesPageToFit = YES;
    webView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.25f];
    [view addSubview:webView];
    
    UIButton *button = [[[UIButton alloc] initWithFrame:CGRectMake(viewBounds.origin.x, viewBounds.origin.y, 40, 40)] autorelease];
    [button setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    self.view = [view autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close:(id)sender
{
    CGRect frame = self.view.frame;
    frame.origin.y = frame.size.height;
    
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationCurveEaseInOut animations:^{
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        
        [self willMoveToParentViewController:nil];
        [self removeFromParentViewController];
    }];
}

@end
