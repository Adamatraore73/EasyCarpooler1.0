//
//  ViewController.m
//  EassyCarpooler
//
//  Created by Adama Traore on 3/14/15.
//  Copyright (c) 2015 Adama Traore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSegueWithIdentifier:@"goto_login" sender:self];
}

- (IBAction)logoutTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goto_login" sender:self];
}

@end
