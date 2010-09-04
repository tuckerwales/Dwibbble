//
//  DwibbblePlayer.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DwibbblePlayer : NSObject {
	int		playerID;
	NSString *url;
	NSString *avatarURL;
	NSString *location;
	NSString *twitter;
	int		shots;
	int		draftees;
	int		followers;
	int		following;
	int		commentsCount;
	int		commentsReceived;
	int		likesCount;
	int		likesReceived;
	int		reboundsCount;
	int		reboundsReceived;
	NSString *creationDate;
	BOOL	complete;
}

+ (DwibbblePlayer *)initWithPlayerID:(int)p;
- (void)gatherInformation;

- (int)playerID;
- (NSString *)url;
- (NSString *)avatarURL;
- (NSString *)location;
- (NSString *)twitter;
- (int)shots;
- (int)draftees;
- (int)followers;
- (int)following;
- (int)commentsCount;
- (int)commentsReceived;
- (int)likesCount;
- (int)likesReceived;
- (int)reboundsCount;
- (int)reboundsReceived;
- (NSString *)creationDate;
- (BOOL)complete;

@end
