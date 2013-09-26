//
//  Camera_ViewController.h
//  CollectionView
//
//  Created by Peter Lee on 4/17/13.
//
//

#import "ViewController.h"


@interface CameraViewController : UIViewController  <UIWebViewDelegate>



@property (nonatomic,strong) IBOutlet UIWebView *Camera_View;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *web_activity;
@property (nonatomic,strong) IBOutlet UILabel *load_status;




@end
