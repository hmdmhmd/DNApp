//
//  ViewController.m
//  DNApp
//
//  Created by HMD on 8/14/15.
//  Copyright © 2015 HMD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIImageView *imgMailIcon;
@property (weak, nonatomic) IBOutlet UIImageView *imgPasswordIcon;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.txtUserName.delegate = self;
    self.txtPassword.delegate = self;
}

-(void)textFieldDidBeginEditing:(nonnull UITextField *)textField{
    if (textField == self.txtUserName) {
        [self.txtUserName setBackground:[UIImage imageNamed:@"input-outline-active"]];
        [self.txtPassword setBackground:[UIImage imageNamed:@"input-outline"]];
        
        [self.imgMailIcon setImage:[UIImage imageNamed:@"icon-mail-active"]];
        [self.imgPasswordIcon setImage:[UIImage imageNamed:@"icon-password"]];
    } else if (textField == self.txtPassword){
        [self.txtUserName setBackground:[UIImage imageNamed:@"input-outline"]];
        [self.txtPassword setBackground:[UIImage imageNamed:@"input-outline-active"]];
        
        [self.imgMailIcon setImage:[UIImage imageNamed:@"icon-mail"]];
        [self.imgPasswordIcon setImage:[UIImage imageNamed:@"icon-password-active"]];
    }
}

- (IBAction)textFieldChangedText:(UITextField *)sender {
    if (sender.text.length > 15) {
        if (sender == self.txtUserName) {
            self.imgMailIcon.hidden = YES;
        } else {
            self.imgPasswordIcon.hidden = YES;
        }
    } else {
        if (sender == self.txtUserName) {
            self.imgMailIcon.hidden = NO;
        } else {
            self.imgPasswordIcon.hidden = NO;
        }
    }
}

-(void)AnimeTest {
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.btnLogin.transform = CGAffineTransformMakeTranslation(10, 0);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.1
                                          animations:^{
                                              self.btnLogin.transform = CGAffineTransformMakeTranslation(-10, 0);
                                          }
                                          completion:^(BOOL finished){
                                              [UIView animateWithDuration:0.1
                                                               animations:^{
                                                                   self.btnLogin.transform = CGAffineTransformMakeTranslation(0, 0);
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
                         if (self.loginView.frame.origin.y == 144) {
                             self.loginView.frame = CGRectMake(self.loginView.frame.origin.x,
                                                               self.loginView.frame.origin.y - 60,
                                                               self.loginView.frame.size.width,
                                                               self.loginView.frame.size.height + 20);
                         }
                     }
                     completion:nil
     ];
}

- (IBAction)LoginClicked:(id)sender {
    
    if ([self.txtUserName.text  isEqual: @"hamid"]) {
        [self performSegueWithIdentifier:@"loginSegueToHome" sender:self];
    } else {
        //self.loadingView.hidden = NO;
        [self AnimeTest];
    }
    
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

