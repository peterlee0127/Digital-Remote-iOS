//
//  LoginViewController.m
//  CollectionView
//
//  Created by Peter Lee on 4/22/13.
//
//

#import "LoginViewController.h"
#import "DataSave.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
       
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        //iPhone Login/Logout Button
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
  
        
        if(result.height == 568)
        {
            // 4 inch
          
            UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background2.png"]];
            [self.view addSubview:imgView];
            [self.view sendSubviewToBack:imgView];
        }
        else
        {
            // 3.5 inch
            UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background2.png"]];
            [self.view addSubview:imgView];
            [self.view sendSubviewToBack:imgView];
        }
    }
    else
    {
    
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"linen.jpg"]];
        [self.view addSubview:imgView];
        [self.view sendSubviewToBack:imgView];
   
    }

    
    CGRect account_frameRect = self.email.frame;
    account_frameRect.size.height = 130;
    self.email.frame = account_frameRect;
    
    CGRect password_frameRect = self.password.frame;
    password_frameRect.size.height = 130;
    self.password.frame =password_frameRect;
    
    self.email.textAlignment = NSTextAlignmentCenter;
    self.email.font = [UIFont boldSystemFontOfSize:20];
    self.email.textColor = [UIColor blackColor];
    self.email.borderStyle = UITextBorderStyleNone;
    self.email.background=[UIImage imageNamed:@"textipad.png"];
    
    self.password.textAlignment = NSTextAlignmentCenter;
    self.password.textColor = [UIColor blackColor];
    self.password.font = [UIFont boldSystemFontOfSize:20];
    self.password.borderStyle = UITextBorderStyleNone;
    self.password.background=[UIImage imageNamed:@"textipad.png"];
    
    
    
    
    [UIView animateWithDuration:0.4 animations:^{
        
        CGRect frame;
        
        // move our subView to its new position
        frame=self.view.frame;
        frame.origin.y=330;
        self.view.frame=frame;
           self.view.alpha=1.0;
        
        // let's move our textField too
        frame= self.password.frame;
        frame.origin.y=100;
       self.password.frame=frame;
        self.email.frame=frame;
        
    }];
    

    
    self.email.text=[[DataSave shareInstance] load_Email];
    self.password.text=[[DataSave shareInstance] load_Password];
    if( (self.email.text !=NULL ) && (self.password.text !=NULL) && [[[DataSave shareInstance] load_status] isEqualToString:@"yes"] )
    {
       [ self performSegueWithIdentifier:@"LoginView" sender:self];
        
    }
    [ self performSegueWithIdentifier:@"LoginView" sender:self];
	// Do any additional setup after loading the view.
}
-(IBAction)closeKeyboard:(id)sender
{

    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Login:(id)sender

{
    [[DataSave shareInstance] save_Email:self.email.text];
    [[DataSave shareInstance] save_Password:self.password.text];
    
    


    NSString *email=self.email.text;
    NSString *pass=self.password.text;
    if([email isEqualToString:@""] || [pass isEqualToString:@""])
    {
        UIAlertView *error=[[UIAlertView alloc] initWithTitle:@"錯誤" message:@"Email or 密碼為空" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [error show];
        error=nil;
    }
    else
    {
        MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:@"163.13.128.173:8080" customHeaderFields:nil];
      
        
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                                email, @"account",
                                pass, @"password",nil];
        

        
        MKNetworkOperation *op = [engine operationWithPath:@"/login" params:params httpMethod:@"POST"];
 
        
        [op addCompletionHandler:^(MKNetworkOperation *operation) {
            
            NSString *result;
            
           // NSLog(@"response=%@",[operation responseString]);
            if([[operation responseString] isEqualToString:@"ok"])
            {
               
                result=@"登入成功!!";
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:result message:@"歡迎使用 居家小幫手 :)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                 [self performSegueWithIdentifier:@"LoginView" sender:self];
                [[DataSave shareInstance] save_login_status:@"yes"];
            }
            else
            {
                 result=@"登入失敗!!";
                 [[DataSave shareInstance] save_login_status:@"no"];
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:result message:@"請檢查帳號密碼 是否正確\n系統是否設定完成 :(" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            
            }
            
          
            
            
            
        }errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
            NSLog(@"MKNetwork request error : %@", [err localizedDescription]);
            //發生Error
        }];
        [engine enqueueOperation:op];
        
        engine=nil;

    
    
    
    }
    
 

}

@end
