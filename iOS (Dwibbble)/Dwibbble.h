/*
 *  Dwibbble.h
 *  
 *
 *  Created by Joshua Lee Tucker on 04/09/2010.
 *  Copyright 2010 Stunnify. All rights reserved.
 *
 */

#define VERSION [NSString stringWithFormat:@"0.1a"];

#import <Foundation/Foundation.h>
#import "DwibbbleShot.h"
#import "DwibbblePlayer.h"

@class Reachability;

@protocol DwibbbleDelegate
@required
- (void)didReceiveShot:(DwibbbleShot *)shot;
- (void)didReceivePlayer:(DwibbblePlayer *)player;
- (void)didReceiveError:(NSString *)error;
@end

@interface Dwibbble : NSObject <DwibbbleShotDelegate, DwibbblePlayerDelegate> {
	id delegate;
	DwibbbleShot *shot;
	DwibbblePlayer *player;
	Reachability *internetReachable;
	Reachability *hostReachable;
	BOOL internetIsReachable;
}

@property (readonly) BOOL internetIsReachable;

- (void)getShotWithID:(int)shotID;
- (void)getPlayerWithID:(NSString *)playerID;

#pragma mark Reachability Methods
- (BOOL)isReachable;

@property (nonatomic, assign) id delegate;

@end