//
//  WebSocketViewController.m
//  CollectionView
//
//  Created by Peter Lee on 4/19/13.
//
//

#import "WebSocketViewController.h"
#import "SocketIOPacket.h"

@interface WebSocketViewController ()

@end

@implementation WebSocketViewController

@synthesize socketIO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void) viewDidLoad
{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(applicationWillResignActive)
               name:@"applicationWillResignActive"
             object:nil];
    [nc addObserver:self
           selector:@selector(applicationDidBecomeActive)
               name:@"applicationDidBecomeActive"
             object:nil];
    
    
    
    
    
    self.socketIO = [[SocketIO alloc] initWithDelegate:self];
    [self.socketIO connectToHost:@"163.13.143.211" onPort:8124];
}

-(void) viewWillDisappear:(BOOL)animated
{
    // Stop Socket.io connecting

    [self.socketIO disconnect];
}

- (void)applicationDidBecomeActive
{
    
    // localhost:3000に接続開始
    [self.socketIO connectToHost:@"163.13.128.176" onPort:8124];
}

- (void)applicationWillResignActive
{
    // 接続終了
    //  NSLog(@"%s", __func__);
    [self.socketIO disconnect];
}

- (void) socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet
{
    //NSLog(@"didReceiveMessage() >>> data: %@", packet.data);
}
#pragma mark - socket.IO-objC method

// サーバとの接続が成功したときに実行されるメソッド
- (void)socketIODidConnect:(SocketIO *)socket
{
    //  NSLog(@"%s", __func__);
    
}

// イベントを受信したときに実行されるメソッド
- (void)socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    //     NSLog(@"%s", __func__);
    //   NSLog(@"%@",packet.data);
    
    
    
    NSData *jsonData = [packet.data dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error:&e];
    
    if(dict!=nil)
    {
        if([[dict objectForKey:@"args"] objectAtIndex:0] !=nil)
        {
            [UIView animateWithDuration:1.0 animations:^{
                
             
            

            self.temp.text=[NSString stringWithFormat:@"溫度:%@",[[[dict objectForKey:@"args"] objectAtIndex:0] objectForKey:@"temp"]];
            self.light.text=[NSString stringWithFormat:@"光線:%@",[[[dict objectForKey:@"args"] objectAtIndex:0] objectForKey:@"light"]];
            self.humidity.text=[NSString stringWithFormat:@"濕度:%@",[[[dict objectForKey:@"args"] objectAtIndex:0] objectForKey:@"humidity"]];
            }];
        }
        else
        {
            self.temp.text=@"資料錯誤";
            self.light.text=@"資料錯誤";
            self.humidity.text=@"資料錯誤";
            [self.navigationController popViewControllerAnimated:YES];

        }
    }
    else
    {
        self.temp.text=@"資料錯誤";
        self.light.text=@"資料錯誤";
        self.humidity.text=@"資料錯誤";
        [self.navigationController popViewControllerAnimated:YES];

    }
    
    
    
}

// サーバとの接続が切断されたときに実行されるメソッド
- (void)socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error
{
    //  NSLog(@"%s", __func__);
    
    
}
-(void) socketIO:(SocketIO *)socket onError:(NSError *)error
{
    NSLog(@"error=%@",error);
     [self performSegueWithIdentifier:@"LoginView" sender:self];
}

-(NSUInteger) supportedInterfaceOrientations {
    return UIDeviceOrientationPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end