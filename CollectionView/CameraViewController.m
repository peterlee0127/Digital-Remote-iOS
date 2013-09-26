//
//  Camera_ViewController.m
//  CollectionView
//
//  Created by Peter Lee on 4/17/13.
//
//

#import "CameraViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface CameraViewController ()

@end

@implementation NSURLRequest (NSURLRequestWithIgnoreSSL)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}

@end

@implementation CameraViewController

@synthesize web_activity,Camera_View,load_status;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWeb];
    Camera_View.delegate=self;
  
    
	// Do any additional setup after loading the view.
}

-(void) loadWeb
{
    
    [self.web_activity startAnimating];
    
    NSString *urlAddress = @"http://163.13.143.212:8081/javascript_simple.html";
    
  //  NSString *urlAddress = @"https://admin:admin@163.13.128.176:8080/";
    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [self.Camera_View loadRequest:requestObj];

    

}



-(void) viewDidDisappear:(BOOL)animated
{
    Camera_View=nil;
    load_status=nil;
    web_activity=nil;
}
-(IBAction)reload:(id)sender
{
        [self.Camera_View reload];
}
- (UIImage*)captureView:(UIView *) thisview
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [thisview.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (IBAction)saveScreenshotToPhotosAlbum:(UIView *)view
{
    UIImageWriteToSavedPhotosAlbum([self captureView:self.view], nil, nil, nil);
}


# pragma mark -UIWebViewDelegate

-(void) webViewDidStartLoad:(UIWebView *)webView
{
    self.load_status.alpha=1;
    self.web_activity.alpha=1;
    
    [self.web_activity startAnimating];
    self.load_status.text=@"載入中..";
    
}
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.web_activity stopAnimating];
    self.load_status.text=@"載入完成";
    
    [UIView animateWithDuration:1.0 animations:^{
        
        self.web_activity.alpha=0;
        self.load_status.alpha=0;
    }];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.web_activity stopAnimating];
    self.load_status.text=@"載入錯誤";
    
    
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"連線錯誤" message:@"無法載入網頁" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    [UIView animateWithDuration:5.0 animations:^{
        
        self.web_activity.alpha=0;
        self.load_status.alpha=0;
    }];

    [self.navigationController popViewControllerAnimated:YES];

    
}
-(NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return UIInterfaceOrientationMaskPortrait;
    }
    else
    {
        return UIInterfaceOrientationMaskAll;
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
