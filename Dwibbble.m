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

- (void)getShotWithID:(int)shotID {
	if ([self isReachable]) {
		shot = [[DwibbbleShot alloc] init];
		shot.delegate = self;
		[shot getShotWithID:shotID];
	} else {
		[self.delegate didReceiveError:@"No internet connection!"];
	}
}

- (void)getPlayerWithID:(NSString *)playerID {
	if ([self isReachable]) {
		player = [[DwibbblePlayer alloc] init];
		player.delegate = self;
		[player getPlayerWithID:playerID];
	} else {
		[self.delegate didReceiveError:@"No internet connection!"];
	}
}

- (void)receivedShot:(DwibbbleShot *)receivedShot {
	NSLog(@"Houston, we received a shot!");
	shot = receivedShot;
	[receivedShot release];
	[self.delegate didReceiveShot:shot];
}

- (void)receivedPlayer:(DwibbblePlayer *)receivedPlayer {
	NSLog(@"Houston, we received a player!");
	player = receivedPlayer;
	[receivedPlayer release];
	[self.delegate didReceivePlayer:player];
}

- (void)receivedError:(NSString *)error {
	NSLog(@"Marshall, we have an error!");
	[self.delegate didReceiveError:error];
}

#pragma mark Reachability Methods

- (BOOL)isReachable {
	Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
	NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
	if (remoteHostStatus == NotReachable) {
		return NO;
	} else if (remoteHostStatus == ReachableViaWWAN || ReachableViaWiFi) {
		return YES;
	} else {
		return NO;
	}

}

@end
