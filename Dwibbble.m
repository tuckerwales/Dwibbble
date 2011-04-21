//
//  Dwibbble.m
//  
//
//  Created by Joshua Lee Tucker on 05/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "Dwibbble.h"

@implementation Dwibbble

@synthesize delegate;

#pragma mark Class Methods

+ (NSString *)version {
	return VERSION;
}

#pragma mark Dwibbble Methods

- (void)getShotWithID:(int)shotID {
	if (shot != NULL) {
		[shot release];
	}
		shot = [[DwibbbleShot alloc] init];
		shot.delegate = self;
		[shot getShotWithID:shotID];
}

- (void)getPlayerWithID:(NSString *)playerID {
	if (player != NULL) {
		[player release];
	}	
	player = [[DwibbblePlayer alloc] init];
	player.delegate = self;
	[player getPlayerWithID:playerID];
}

- (void)getListWithType:(NSString *)type {
	if (shotList != NULL) {
		[shotList release];
	}
	shotList = [[DwibbbleList alloc] init];
	shotList.delegate = self;
	[shotList getListWithType:type];
}

#pragma mark DwibbbleShot Delegate

- (void)receivedShot:(DwibbbleShot *)receivedShot {
	NSLog(@"Houston, we received a shot!");
	shot = receivedShot;
	[receivedShot release];
	[self.delegate didReceiveShot:shot];
}

#pragma mark DwibbblePlayer Delegate

- (void)receivedPlayer:(DwibbblePlayer *)receivedPlayer {
	player = receivedPlayer;
	[receivedPlayer release];
	[self.delegate didReceivePlayer:player];
}

#pragma mark DwibbbleList Delegate

- (void)receivedList:(NSMutableArray *)list {
	[self.delegate didReceiveList:list];
}

#pragma mark Error Delegate

- (void)receivedError:(NSString *)error {
	[self.delegate didReceiveError:error];
}

@end
