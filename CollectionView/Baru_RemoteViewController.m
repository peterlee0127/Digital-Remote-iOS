//
//  Baru_RemoteViewController.m
//  CollectionView
//
//  Created by Peter Lee on 5/4/13.
//
//

#import "Baru_RemoteViewController.h"

@interface Baru_RemoteViewController ()

@end

@implementation Baru_RemoteViewController

@synthesize baru_remote_webview;

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
    [self loadWeb];
    
    
	// Do any additional setup after loading the view.
}

-(void) loadWeb
{
    
    NSString *urlAddress = @"http://163.13.143.212:8080/remote_baru";
    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [self.baru_remote_webview loadRequest:requestObj];
    
    
    
}
-(IBAction)reloadweb:(id)sender
{
    [self.baru_remote_webview reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
