//
//  ViewController.m
//  MyLocation
//
//  Created by indianic on 25/03/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ProfileViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)FBLoginClick:(id)sender {
   
    if ([FBSDKAccessToken currentAccessToken])
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"Facebook" forKey:@"LoginProfile"];
        [self jumptoProfile];
    }
    {
        
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
        [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
        login.loginBehavior= FBSDKLoginBehaviorSystemAccount;
        [login logInWithPublishPermissions:@[@"publish_actions"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            if (error) {
                NSLog(@"Error");
            }else{
                [[NSUserDefaults standardUserDefaults] setObject:@"Facebook" forKey:@"LoginProfile"];
                [self jumptoProfile];
                
            }
        }];
    }
}



-(void)jumptoProfile
{
    ProfileViewController *obj  =[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self presentViewController:obj animated:YES completion:nil];
}
@end
