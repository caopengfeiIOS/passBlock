//
//  FirstViewController.m
//  代理传值
//
//  Created by hbgl on 17/2/24.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()<Countpass>
@property (weak, nonatomic) IBOutlet UILabel *blockText;
@property (weak, nonatomic) IBOutlet UILabel *delegateText;
@property (weak, nonatomic) IBOutlet UILabel *notifitionText;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   //    self.blockText.text = [NSString stringWithFormat:<#(nonnull NSString *), ...#>]
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(passWord:) name:@"passWord" object:nil];;
}
- (IBAction)passPush:(id)sender {
    
       //将我们的storyBoard实例化，“Main”为StoryBoard的名称
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //将第二个控制器实例化，"SecondViewController"为我们设置的控制器的ID
    SecondViewController *secondViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    secondViewController.delegate = self;
    secondViewController.block=^(NSString * str)
    {
        self.blockText.text = str;
    };

    
    //跳转事件
    self.blockText.text = nil;
    self.delegateText.text = nil;
    self.notifitionText.text = nil;
    [self.navigationController pushViewController:secondViewController animated:YES];
}
-(void)passWord:(NSNotification*)sender
{
    self.notifitionText.text = [sender.userInfo objectForKey:@"userInfo"];
}
-(void)setCount:(NSString *)str
{
    self.delegateText.text =str;
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
