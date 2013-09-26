//
//  Member_ViewController.m
//  CollectionView
//
//  Created by Peter Lee on 4/24/13.
//
//

#import "Member_ViewController.h"

@interface Member_ViewController ()

@end
/*
@implementation NSURLRequest (NSURLRequestWithIgnoreSSL)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}
@end
*/
@implementation Member_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"linen.jpg"]];
    [self.view addSubview:imgView];
    [self.view sendSubviewToBack:imgView];
    [self loadWeb];
	// Do any additional setup after loading the view.
}
-(void) loadWeb
{
    
    NSString *urlAddress = @"http://163.13.143.211:8001/";
    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [self.member_webview loadRequest:requestObj];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
