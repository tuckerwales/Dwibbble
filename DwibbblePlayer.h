//
//  DwibbblePlayer.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DwibbblePlayer : NSObject {
	NSString *playerID;
	NSString *url;
	NSString *avatarURL;
	NSString *location;
	NSString *twitter;
	int		shots;
	NSString *drafter;
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
	NSMutableData *connectionData;
	NSArray *parsedJson;
}

- (DwibbblePlayer *)initWithPlayerID:(NSString *)playerID;

- (NSString *)playerID;
- (NSString *)url;
- (NSString *)avatarURL;
- (NSString *)location;
- (NSString *)twitter;
- (int)shots;
- (NSString *)drafter;
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
- (void)setDetails;

@end
