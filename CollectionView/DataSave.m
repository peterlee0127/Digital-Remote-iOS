//
//  DataSave.m
// 
//
//  Created by PeterLee on 12/5/29.
//  Copyright (c) 2012年 Peterlee All rights reserved.
//


#import "DataSave.h"
#import "FBEncryptorAES.h"
#import "NSData+Base64.h"

NSString *password_key=@"password"; //password 加密key
NSString *token_key=@"token";   //token 加密key

@interface DataSave()
    -(id)init;
@end

static DataSave *_shareInstance=nil;
@implementation DataSave

@synthesize userPrefs;


+(id) shareInstance
{
   if(_shareInstance==nil)
   {
       _shareInstance=[[DataSave alloc] init];
   }
    
    return _shareInstance;
}
-(id) init
{
    self = [super init];
    if(self != nil)
    {
        self.userPrefs = [NSUserDefaults standardUserDefaults];
    }
    
    return self;


}
-(void) savaData:(NSString *) email pass:(NSString *) password
{
    password=[FBEncryptorAES encryptBase64String:password
                              keyString:password_key
                          separateLines:NO];
    [userPrefs setObject:email forKey:@"email"];
    [userPrefs setObject:password forKey:@"password"];
    [userPrefs synchronize]; //write to file
    
}

#pragma mark -  Email
-(void)save_Email:(NSString *) email
{
    [userPrefs setObject:email forKey:@"email"];
    [userPrefs synchronize]; //write to file
    
}
-(NSString*) load_Email
{
    NSString *email = [userPrefs stringForKey:@"email"];
    return email;
}
#pragma mark -  Status

-(void)save_login_status:(NSString *) flag
{
    [userPrefs setObject:flag forKey:@"login_status"];
    [userPrefs synchronize]; //write to file
    
}
-(NSString*) load_status
{
    NSString *flag = [userPrefs stringForKey:@"login_status"];
    return flag;

}

#pragma mark -  Uid
-(void)save_Uid:(NSString *) uid
{
    [userPrefs setObject:uid forKey:@"uid"];
    [userPrefs synchronize]; //write to file

}
-(NSString*) load_Uid
{
    NSString *uid = [userPrefs stringForKey:@"uid"];
    return uid;
}



#pragma mark -  Password

-(void) save_Password:(NSString *)password
{
    password=[FBEncryptorAES encryptBase64String:password
                                       keyString:password_key
                                   separateLines:NO];
    [userPrefs setObject:password forKey:@"password"];
    [userPrefs synchronize]; //write to file
}
-(NSString*) load_Password
{
    NSString *password = [userPrefs stringForKey:@"password"];
    password=[FBEncryptorAES decryptBase64String:password
                                       keyString:password_key];
    
    return password;
}




@end
