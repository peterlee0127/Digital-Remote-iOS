//
//  DVDViewController.h
//  CollectionView
//
//  Created by Peter Lee on 5/8/13.
//
//

#import <UIKit/UIKit.h>

@interface DVDViewController : UIViewController


@property (nonatomic,strong) IBOutlet UIWebView *dvd_webview;

-(IBAction)reload:(id)sender;

@end
