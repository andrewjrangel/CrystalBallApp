//
//  MainViewController.h
//  CrystalBallApp
//
//  Created by Ventura Rangel on 3/26/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
-(IBAction)fortuneButton:(id)sender;
-(IBAction)resetUses:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *fortuneLabel;
@property (strong, nonatomic) IBOutlet UIButton *tooManyPressesOutlet;


@end
