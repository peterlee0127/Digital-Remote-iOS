//
//  GraphViewController.h
//  CollectionView
//
//  Created by Peter Lee on 4/28/13.
//
//

#import <UIKit/UIKit.h>

@interface GraphViewController : UIViewController  <UIWebViewDelegate>



@property (nonatomic,strong) IBOutlet UIWebView *Camera_View;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *web_activity;
@property (nonatomic,strong) IBOutlet UILabel *load_status;



@end
