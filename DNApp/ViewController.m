//
//  ViewController.m
//  DNApp
//
//  Created by HMD on 8/14/15.
//  Copyright © 2015 HMD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIView *loginView;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    //i have added some comment here to test gitup
}

- (IBAction)LoginClicked:(id)sender {
    //_lblStatus.text = @"hamid";
    
   [UIView animateWithDuration:0.1
                    animations:^{
                        self.btnLogin.frame = CGRectOffset(self.btnLogin.frame, 10, 0);
                    }
                    completion:^(BOOL finished){
                        [UIView animateWithDuration:0.1
                                         animations:^{
                                            self.btnLogin.frame = CGRectOffset(self.btnLogin.frame, -10, 0);
                                         }
                                         completion:^(BOOL finished){
                                             [UIView animateWithDuration:0.1
                                                              animations:^{
                                                                  self.btnLogin.frame = CGRectOffset(self.btnLogin.frame, 10, 0);
                                                              }
                                                              completion:^(BOOL finished){
                                                                  
                                                              }
                                              ];
                                         }
                         ];
                    }
    ];
    
    [UIView animateWithDuration:0.3 delay:0
         usingSpringWithDamping:0.5 initialSpringVelocity:1.0
                        options:0
                     animations:^{
                         self.LoginView.frame = CGRectMake(self.LoginView.frame.origin.x, self.LoginView.frame.origin.y
                                                           , self.LoginView.frame.size.width, self.LoginView.frame.size.height + 20);
                     }
                     completion:nil
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindForSegue:(nonnull UIStoryboardSegue *)unwindSegue towardsViewController:(nonnull UIViewController *)subsequentVC:(id)sender
{}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end

