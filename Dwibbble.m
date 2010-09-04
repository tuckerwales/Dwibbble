//
//  Dwibbble.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "Dwibbble.h"


@implementation Dwibbble

+ (NSString *)version {
	return VERSION;
}

- (DwibbbleShot *)shotForID:(int)shotID {
	return [[DwibbbleShot alloc] initWithShotID:shotID];
}

- (DwibbblePlayer *)playerForID:(NSString *)playerID {
	return [[DwibbblePlayer alloc] initWithPlayerID:playerID];
}

- (DwibbbleCluster *)reboundsForID:(int)shotID {
	// Yet to be implemeneted.
}
- (DwibbbleCluster *)commentsForID:(int)shotID {
	// Yet to be implemeneted.
}

- (DwibbbleCluster *)shotsForPlayerID:(NSString *)playerID {
	// Yet to be implemeneted.
}

- (DwibbbleCluster *)shotsForList:(NSString *)list {
	// Yet to be implemeneted.
}
	
@end
