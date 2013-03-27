//
//  MainViewController.m
//  CrystalBallApp
//
//  Created by Ventura Rangel on 3/26/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


NSArray *fortunes;
NSString *fortune;
@synthesize fortuneLabel;
@synthesize tooManyPressesOutlet;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fortunes = [[NSArray alloc]
                initWithObjects:
                @"Maybe",
                @"Doesn't look good",
                @"Probably not",
                @"Better luck next time",
                @"No way",
                @"Heck no",
                @"Hahahahaha",
                nil];
    BOOL over = [[NSUserDefaults standardUserDefaults] boolForKey:@"overage"];
    if (over) {
        [tooManyPressesOutlet setHidden:YES];
        UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You need to buy the premium version for more fortunes" delegate:nil cancelButtonTitle:@"Purchase" otherButtonTitles:@"Cancel", nil];
        [overageAlert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


int count = 0;


-(IBAction)fortuneButton:(id)sender{
    count = count +1;
    
    int myIndex = arc4random_uniform(fortunes.count);
    NSString *fortune = [fortunes objectAtIndex:myIndex];
    fortuneLabel.text = [NSString stringWithFormat:@"%@",fortune];
    
    if(count >= 3){
        [tooManyPressesOutlet setHidden:YES];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];
        
        UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"No More" message:@"You only have 3 fortunes, you should upgrade" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [overageAlert show];
    }
}





@end
