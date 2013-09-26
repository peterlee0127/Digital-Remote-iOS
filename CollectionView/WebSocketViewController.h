//
//  WebSocketViewController.h
//  CollectionView
//
//  Created by Peter Lee on 4/19/13.
//
//

#import <UIKit/UIKit.h>
#import "SocketIO.h"

@interface WebSocketViewController : UIViewController <SocketIODelegate>

@property (nonatomic,strong) IBOutlet UILabel *temp,*light,*humidity;
@property (nonatomic,strong) SocketIO *socketIO;


@end
