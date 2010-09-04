//
//  Dwibbble.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Dwibbble : NSObject {
	
}

- (DwibbbleShot *)shotForID:(int)shotID;
- (DwibbblePlayer *)playerForID:(NSString *)playerID;
- (DwibbbleCluster *)reboundsForID:(int)shotID;
- (DwibbbleCluster *)commentsForID:(int)shotID;
- (DwibbbleCluster *)shotsForPlayerID:(NSString *)playerID;
- (DwibbbleCluster *)shotsForList:(NSString *)list;

@end
