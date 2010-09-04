//
//  Dwibbble.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "Dwibbble.h"


@implementation Dwibbble

+ (Dwibbble *)init {
	self = [super init];
	if (self) {
		APIEndpoint = @"http://dribbble.com/";
	}
	return self;
}

+ (NSString *)version {
	return VERSION;
}

- (NSString *)APIEndpoint {
	return APIEndpoint;
}

- (DwibbbleShot *)shotForID:(int)shotID {
	
}

- (DwibbblePlayer *)playerForID:(NSString *)playerID {
	
}

- (DwibbbleCluster *)reboundsForID:(int)shotID {
	
}
- (DwibbbleCluster *)commentsForID:(int)shotID {
	
}

- (DwibbbleCluster *)shotsForPlayerID:(NSString *)playerID {
	
}

- (DwibbbleCluster *)shotsForList:(NSString *)list {
	
}
	
@end
