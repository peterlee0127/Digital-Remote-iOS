//
//  FanViewController.m
//  CollectionView
//
//  Created by Peter Lee on 5/8/13.
//
//

#import "FanViewController.h"

@interface FanViewController ()

@end

@implementation FanViewController

@synthesize fan_webview;

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
	// Do any additional setup after loading the view.
    [self loadweb];
    
}
-(void )loadweb
{
    
    NSString *urlAddress = @"http://163.13.143.212:8080/remote_fan";
    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [self.fan_webview loadRequest:requestObj];


}
-(IBAction)reload:(id)sender
{
    [self.fan_webview reload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
