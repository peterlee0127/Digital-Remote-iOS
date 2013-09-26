//
//  DataSave.h
//  
//
//  Created by PeterLee on 12/5/29.
//  Copyright (c) 2012年 Peterlee All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DataSave : NSObject
{
  @public  NSUserDefaults *userPrefs;
}

@property (nonatomic, strong) NSUserDefaults *userPrefs;

+(id) shareInstance;
-(void) savaData:(NSString *) email pass:(NSString *) password;

-(void)save_Email:(NSString *) email;
-(NSString*) load_Email;

-(void)save_Uid:(NSString *) uid;
-(NSString*) load_Uid;

-(void)save_login_status:(NSString *) flag;
-(NSString*) load_status;

-(void) save_Password:(NSString *)password;
-(NSString*) load_Password;


@end
