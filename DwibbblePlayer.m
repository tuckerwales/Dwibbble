//
//  DwibbblePlayer.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbblePlayer.h"

@implementation DwibbblePlayer

@synthesize delegate;
@synthesize playerID;
@synthesize url;
@synthesize avatarURL;
@synthesize location;
@synthesize twitter;
@synthesize shots;
@synthesize drafter;
@synthesize draftees;
@synthesize followers;
@synthesize following;
@synthesize commentsCount;
@synthesize commentsReceived;
@synthesize likesCount;
@synthesize likesReceived;
@synthesize reboundsCount;
@synthesize reboundsReceived;
@synthesize creationDate;

#pragma mark DwibbblePlayer Methods

- (void)getPlayerWithID:(NSString *)p {
	playerID = p;
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/players/%@", p];
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)setDetails {
	url = [parsedData valueForKey:@"url"];
	avatarURL = [parsedData valueForKey:@"avatar_url"];
	location = [parsedData valueForKey:@"location"];
	twitter = [parsedData valueForKey:@"twitter_screen_name"];
	drafter = [parsedData valueForKey:@"drafted_by_player_id"];
	shots = (int)[parsedData valueForKey:@"shots_count"];
	draftees = (int)[parsedData valueForKey:@"draftees_count"];
	followers = (int)[parsedData valueForKey:@"followers_count"];
	following = (int)[parsedData valueForKey:@"following_count"];
	commentsCount = (int)[parsedData valueForKey:@"comments_count"];
	commentsReceived = (int)[parsedData valueForKey:@"comments_received_count"];
	likesCount = (int)[parsedData valueForKey:@"likes_count"];
	likesReceived = (int)[parsedData valueForKey:@"likes_received_count"];
	reboundsCount = (int)[parsedData valueForKey:@"rebounds_count"];
	reboundsReceived = (int)[parsedData valueForKey:@"rebounds_received_count"];
	creationDate = [parsedData valueForKey:@"created_at"];
	[self.delegate receivedPlayer:self];
}

#pragma mark DwibbbleRequest Delegate Methods

- (void)receivedDataFromConnection:(NSMutableData *)data {
	[request release];
	parser = [[DwibbbleParser alloc] init];
	parser.delegate = self;
	[parser parseWithData:data];
}

- (void)receivedErrorFromConnection:(NSString *)error {
	[request release];
	[self.delegate receivedError:error];
}

#pragma mark DwibbbleParser Delegate Methods

- (void)finishedParsing:(NSMutableArray *)parsedJSON {
	[parser release];
	parsedData = parsedJSON;
	[self setDetails];
}

@end
