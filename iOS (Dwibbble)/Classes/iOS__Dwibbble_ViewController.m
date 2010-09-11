//
//  iOS__Dwibbble_ViewController.m
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 05/09/2010.
//  Copyright Stunnify 2010. All rights reserved.
//

#import "iOS__Dwibbble_ViewController.h"

@implementation iOS__Dwibbble_ViewController

@synthesize playerImage;
@synthesize userField;
@synthesize getButton;

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (IBAction)getAvatar {
	[userField resignFirstResponder];
	dw = [[Dwibbble alloc] init];
	dw.delegate = self;
	[dw getPlayerWithID:[NSString stringWithFormat:@"%@", userField.text]];
}

- (void)didReceivePlayer:(DwibbblePlayer *)player {
	NSLog(@"Well, we got to here...");
	NSURL *imageURL = [NSURL URLWithString:[player avatarURL]];
	NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
	UIImage *image = [[UIImage alloc] initWithData:imageData];
	playerImage.image = image;
	[dw release];
}

- (void)didReceiveShot:(DwibbbleShot *)shot {
	
}

- (void)didReceiveError:(NSString *)error {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
