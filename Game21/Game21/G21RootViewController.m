//
//  G21RootViewController.m
//  Game21
//
//  Created by Joshua E Smith on 2014-05-21.
//  Copyright (c) 2014 Joshua E Smith. All rights reserved.
//

#import "G21RootViewController.h"

@interface G21RootViewController ()

@end

@implementation G21RootViewController {
    UIImageView *myImageView;
    int test;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Screen Shot 2014-04-05"]];
        [self.view addSubview:myImageView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [UIView animateWithDuration:4.0 animations:^{
        myImageView.center = CGPointMake(100.0, 100.0);
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [UIView animateWithDuration:4.0 animations:^{
        myImageView.center = [touch locationInView:self.view];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
