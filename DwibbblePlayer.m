//
//  DwibbblePlayer.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbblePlayer.h"


@implementation DwibbblePlayer

@synthesize playerID;

+ (DwibbblePlayer *)initWithPlayerID:(int)p {
	self = [super init];
	if (self) {
		playerID = p;
		[self gatherInformation];
	}
}

- (void)gatherInformation {
}

- (int)playerID {
	return playerID;
}

- (NSString *)url {
	return url;
}

- (NSString *)avatarURL {
	return avatarURL;
}

- (NSString *)location {
	return location;
}

- (NSString *)twitter {
	return twitter;
}

- (int)shots {
	return shots;
}

- (int)draftees {
	return draftees;
}

- (int)followers {
	return followers;
}

- (int)following {
	return following;
}

- (int)commentsCount {
	return commentsCount;
}

- (int)commentsReceived {
	return commentsReceived;
}

- (int)likesCount {
	return likesCount;
}

- (int)likesReceived {
	return likesReceived;	
}

- (int)reboundsCount {
	return reboundsCount;
}

- (int)reboundsReceived {
	return reboundsReceived;
}

- (NSString *)creationDate {
	return creationDate;
}

- (BOOL)complete {
	return complete;
}

@end
