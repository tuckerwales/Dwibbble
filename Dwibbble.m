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

- (void)getShotWithID:(int)shotID {
	shot = [[DwibbbleShot alloc] init];
	shot.delegate = self;
	[shot getShotWithID:shotID];
}

- (void)getPlayerWithID:(NSString *)playerID {
	player = [[DwibbblePlayer alloc] init];
	player.delegate = self;
	[player getPlayerWithID:playerID];
}

- (void)receivedShot:(DwibbbleShot *)receivedShot {
	NSLog(@"Well, this function was certainly called!");
	[self.delegate didReceiveShot:receivedShot];
}

- (void)receivedPlayer:(DwibbblePlayer *)receivedPlayer {
	NSLog(@"Houston, we received a player!");
	[self.delegate didReceivePlayer:receivedPlayer];
}

<<<<<<< HEAD
- (void)receivedError:(NSError *)error {
	NSLog(@"Marshall, we have an error!");
	[self.delegate didReceiveError:error];
}

=======
>>>>>>> ef4676631daa31a6fad007a21346d9189368b811
@end
