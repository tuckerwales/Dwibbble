/*
 *  Dwibbble.h
 *  
 *
 *  Created by Joshua Lee Tucker on 04/09/2010.
 *  Copyright 2010 Stunnify. All rights reserved.
 *
 */

#define VERSION [NSString stringWithFormat:@"0.4"];

#import <Foundation/Foundation.h>
#import "DwibbbleShot.h"
#import "DwibbblePlayer.h"
#import "DwibbbleList.h"

@protocol DwibbbleDelegate
@required
- (void)didReceiveShot:(DwibbbleShot *)shot;
- (void)didReceivePlayer:(DwibbblePlayer *)player;
- (void)didReceiveList:(NSMutableArray *)list;
- (void)didReceiveError:(NSString *)error;
@end

@interface Dwibbble : NSObject <DwibbbleShotDelegate, DwibbblePlayerDelegate, DwibbbleListDelegate> {
	id delegate;
	DwibbbleShot *shot;
	DwibbblePlayer *player;
	DwibbbleList *shotList;
}

@property (nonatomic, assign) id delegate;

// Class Methods

+ (NSString *)version;

// Dwibbble Methods

- (void)getShotWithID:(int)shotID;
- (void)getPlayerWithID:(NSString *)playerID;
- (void)getListWithType:(NSString *)type;

@end
