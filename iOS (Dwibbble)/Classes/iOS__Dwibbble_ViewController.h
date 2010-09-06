//
//  iOS__Dwibbble_ViewController.h
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 05/09/2010.
//  Copyright Stunnify 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dwibbble.h"

@interface iOS__Dwibbble_ViewController : UIViewController <DwibbbleDelegate> {
	Dwibbble *dw;
	IBOutlet UIImageView *playerImage;
	IBOutlet UITextField *userField;
	IBOutlet UIButton *getButton;
}

- (IBAction)getAvatar;

@property (nonatomic, retain) IBOutlet UIImageView *playerImage;
@property (nonatomic, retain) IBOutlet UITextField *userField;
@property (nonatomic, retain) IBOutlet UIButton *getButton;

@end

