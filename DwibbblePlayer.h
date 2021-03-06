//
//  DwibbblePlayer.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DwibbbleRequest.h"
#import "DwibbbleParser.h"

@class DwibbblePlayer;

@protocol DwibbblePlayerDelegate
@required
- (void)receivedPlayer:(DwibbblePlayer *)player;
- (void)receivedError:(NSString *)error;
@end

@interface DwibbblePlayer : NSObject {
	id		delegate;
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
	NSArray *parsedData;
	DwibbbleRequest *request;
	DwibbbleParser *parser;
}

@property (nonatomic, assign) id delegate;

// Generate getters and setters

@property (readonly) NSString *playerID;
@property (readonly) NSString *url;
@property (readonly) NSString *avatarURL;
@property (readonly) NSString *location;
@property (readonly) NSString *twitter;
@property (readonly) int shots;
@property (readonly) NSString *drafter;
@property (readonly) int draftees;
@property (readonly) int followers;
@property (readonly) int following;
@property (readonly) int commentsCount;
@property (readonly) int commentsReceived;
@property (readonly) int likesCount;
@property (readonly) int likesReceived;
@property (readonly) int reboundsCount;
@property (readonly) int reboundsReceived;
@property (readonly) NSString *creationDate;

- (void)getPlayerWithID:(NSString *)p;
- (void)setDetails;

@end
