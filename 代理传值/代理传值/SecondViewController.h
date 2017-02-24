//
//  SecondViewController.h
//  代理传值
//
//  Created by hbgl on 17/2/24.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Countpass.h"
typedef void (^passWord)(NSString * str);
@interface SecondViewController : UIViewController
@property (nonatomic,copy) void(^block)(NSString * string);
@property (nonatomic,weak) id <Countpass> delegate;
//**    **//
-(void)setPassWord:(passWord)password;
@end
