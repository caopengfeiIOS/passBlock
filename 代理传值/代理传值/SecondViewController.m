//
//  SecondViewController.m
//  代理传值
//
//  Created by hbgl on 17/2/24.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *blockTextfile;
@property (weak, nonatomic) IBOutlet UITextField *delegateField;
@property (weak, nonatomic) IBOutlet UITextField *notifitionField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)popBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (self.blockTextfile.text.length>0) {
        if (self.block) {
            self.block(self.blockTextfile.text);
        }
    }
    if (self.delegateField.text.length>0) {
        if ([self.delegate respondsToSelector:@selector(setCount:)]) {
            [self.delegate setCount:self.delegateField.text];
        }
    }
    if (self.notifitionField.text.length>0) {
        NSDictionary * dic = @{@"userInfo":self.notifitionField.text};
        [[NSNotificationCenter defaultCenter]postNotificationName:@"passWord" object:nil userInfo:dic];
    }
}
-(void)setPassWord:(passWord)password
{
    if (password) {
        password(self.blockTextfile.text);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
