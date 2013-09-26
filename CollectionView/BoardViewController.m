//
//  BoardViewController.m
//  CollectionView
//
//  Created by Peter Lee on 4/24/13.
//
//

#import "BoardViewController.h"
#import "Config.h"

@interface BoardViewController ()

@end

@implementation BoardViewController

@synthesize web_view;

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
    
    NSString *urlAddress = [NSString stringWithFormat:@"%@/board",Hostname];
    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [self.web_view loadRequest:requestObj];
    
    
}

-(IBAction)reload_web:(id)sender
{
    [self.web_view reload];
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{

}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
