//
//  Dwibbble.m
//  
//
//  Created by Joshua Lee Tucker on 05/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "Dwibbble.h"
#import "Reachability.h"

@implementation Dwibbble

@synthesize delegate;
@synthesize internetIsReachable;

- (Dwibbble *)init {
	self = [super init];
	if (self) {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
		internetReachable = [[Reachability reachabilityForInternetConnection] retain];
		[internetReachable startNotifier];
	}
	return self;
}

- (void)getShotWithID:(int)shotID {
	if (internetIsReachable) {
		shot = [[DwibbbleShot alloc] init];
		shot.delegate = self;
		[shot getShotWithID:shotID];
	} else {
		[self.delegate didReceiveError:@"No internet connection!"];
	}
}

- (void)getPlayerWithID:(NSString *)playerID {
	if (internetIsReachable) {
		player = [[DwibbblePlayer alloc] init];
		player.delegate = self;
		[player getPlayerWithID:playerID];
	} else {
		[self.delegate didReceiveError:@"No internet connection!"];
	}
}

- (void)receivedShot:(DwibbbleShot *)receivedShot {
	NSLog(@"Well, this function was certainly called!");
	[self.delegate didReceiveShot:receivedShot];
}

- (void)receivedPlayer:(DwibbblePlayer *)receivedPlayer {
	NSLog(@"Houston, we received a player!");
	[self.delegate didReceivePlayer:receivedPlayer];
}

- (void)receivedError:(NSError *)error {
	NSLog(@"Marshall, we have an error!");
	[self.delegate didReceiveError:[error description]];
}

#pragma mark Reachability Methods
- (void)checkNetworkStatus:(NSNotification *)notification {
	NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
	switch (internetStatus) {
		case NotReachable:
			NSLog(@"The internet is not reachable!");
			internetIsReachable = NO;
			[self.delegate didReceiveError:@"No internet connection!"];
			break;
		case ReachableViaWiFi:
			NSLog(@"The internet is reachable via WiFi!");
			internetIsReachable = YES;
			break;
		case ReachableViaWWAN:
			NSLog(@"The internet is reachable via WiFI!");
			internetIsReachable = YES;
			break;
		default:
			break;
	}
}

#pragma mark Memory Methods

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

@end
