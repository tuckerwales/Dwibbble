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

@protocol DwibbbleDelegate
@required
- (void)didReceiveShot:(DwibbbleShot *)shot;
- (void)didReceivePlayer:(DwibbblePlayer *)player;
<<<<<<< HEAD
- (void)didReceiveError:(NSError *)error;
=======
>>>>>>> ef4676631daa31a6fad007a21346d9189368b811
@end

@interface Dwibbble : NSObject <DwibbbleShotDelegate, DwibbblePlayerDelegate> {
	id delegate;
	@private
	DwibbbleShot *shot;
	DwibbblePlayer *player;
}

- (void)getShotWithID:(int)shotID;
- (void)getPlayerWithID:(NSString *)playerID;

@property (nonatomic, assign) id delegate;

@end