//
//  G21RootViewController.m
//  Game21
//
//  Created by Joshua E Smith on 2014-05-21.
//  Copyright (c) 2014 Joshua E Smith. All rights reserved.
//

#import "G21RootViewController.h"

#import <CoreMotion/CoreMotion.h>
@interface G21RootViewController ()

@end

@implementation G21RootViewController {
    UIImageView *myImageView;
    UIImageView *targetImageView;
    CMMotionManager *myMotionManager;
    int test;
    CGPoint myImageViewPoint;
    CGPoint targetPoint;
    NSTimer *gameTimer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PurpleBall"]];
        targetImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PurpleBall"]];
        [self.view addSubview:myImageView];
        [self.view addSubview:targetImageView];
        myMotionManager = [[CMMotionManager alloc] init];
        [myMotionManager startAccelerometerUpdates];
        gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(updateGameView) userInfo:nil repeats:YES];
        
    }
    return self;
}

- (void)relocateTarget
{
    targetPoint.x = rand() % (int) self.view.frame.size.width;
    targetPoint.y = rand() % (int) self.view.frame.size.height;
    targetImageView.center = targetPoint;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    myImageViewPoint.x = 500;
    myImageViewPoint.y = 500;
    myImageView.center = myImageViewPoint;
    
    srand(time(NULL));
    [self relocateTarget];
    
    /* [UIView animateWithDuration:4.0 animations:^{
     myImageView.center = CGPointMake(100.0, 100.0);
     }];
     */
}

- (void)updateGameView {
    myImageViewPoint.x += myMotionManager.accelerometerData.acceleration.x;
    myImageViewPoint.y -= myMotionManager.accelerometerData.acceleration.y;
    myImageView.center = myImageViewPoint;
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
