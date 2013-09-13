//
//  WebViewController.h
//  WebViewSample
//
//  Created by minds on 13. 9. 9..
//  Copyright (c) 2013년 rhinesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortraitNavigationController : UINavigationController

@end

@interface WebViewController : UIViewController
@property (nonatomic, retain) UIWebView *webView;
@end
