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
- (DwibbbleRebounds *)reboundsForID:(int)shotID;
- (DwibbbleComments *)commentsForID:(int)shotID;
- (DwibbbleCluster *)shotsForPlayerID:(NSString *)playerID;
- (DwibbbleCluster *)shotsForList:(NSString *)list;
- (DwibbblePlayer *)playerForID:(NSString *)playerID;

@end
