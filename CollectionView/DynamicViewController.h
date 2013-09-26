//
//  GraphViewController.h
//  CollectionView
//
//  Created by Peter Lee on 4/28/13.
//
//

#import <UIKit/UIKit.h>

@interface DynamicViewController : UIViewController  <UIWebViewDelegate>



@property (nonatomic,strong) IBOutlet UIWebView *Camera_View;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *web_activity;
@property (nonatomic,strong) IBOutlet UILabel *load_status;

-(IBAction)set_Temp:(id)sender;
-(IBAction)set_light:(id)sender;
-(IBAction)set_Humidity:(id)sender;
-(IBAction)reload:(id)sender;

@end
