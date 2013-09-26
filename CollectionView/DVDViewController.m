//
//  DVDViewController.m
//  CollectionView
//
//  Created by Peter Lee on 5/8/13.
//
//
#import "Config.h"
#import "DVDViewController.h"

@interface DVDViewController ()

@end

@implementation DVDViewController

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
    [self loadweb];
	// Do any additional setup after loading the view.
}
-(void )loadweb
{
    
    NSString *urlAddress =[NSString stringWithFormat:@"%@/remote_dvd",Hostname];

    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [self.dvd_webview loadRequest:requestObj];
    
    
}
-(IBAction)reload:(id)sender
{
    [self.dvd_webview reload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
