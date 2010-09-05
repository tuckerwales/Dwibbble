//
//  Dwibbble.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

// A 'player' is a user
// A 'shot' is a design that a player has uploaded to Dribbble
// A 'rebounds' is a response that a designer makes to a shot

#import <Foundation/Foundation.h>
#import "DwibbbleGeneral.h"
#import "DwibbbleCluster.h"
#import "DwibbblePlayer.h"
#import "DwibbbleShot.h"


@interface Dwibbble : NSObject {
}

+ (NSString *)version;

#pragma mark API Interaction Methods

- (DwibbbleShot *)shotForID:(int)shotID;
- (DwibbblePlayer *)playerForID:(NSString *)playerID;
- (DwibbbleCluster *)reboundsForID:(int)shotID;
- (DwibbbleCluster *)commentsForID:(int)shotID;
- (DwibbbleCluster *)shotsForPlayerID:(NSString *)playerID;
- (DwibbbleCluster *)shotsForList:(NSString *)list;

@end
