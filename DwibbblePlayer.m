//
//  DwibbblePlayer.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbblePlayer.h"
#import "JSON.h"

@implementation DwibbblePlayer


- (DwibbblePlayer *)initWithPlayerID:(NSString *)p {
	self = [super init];
	if (self) {
		playerID = p;
		NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.dribbble.com/players/%@", playerID]];
		NSURLRequest *req = [NSURLRequest requestWithURL:requestURL];
		[NSURLConnection connectionWithRequest:req delegate:self];
	}
	return self;
}

#pragma mark Instance Variable Getters

- (NSString *)playerID {
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

- (NSString *)drafter {
	return drafter;
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

#pragma mark Connection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
	NSString *string = [[NSString alloc] initWithData:data encoding:NSStringEncodingConversionAllowLossy];
	NSLog(@"%@", string);
	[string release];
	if (connectionData == nil) {
		connectionData = [[NSMutableData data] retain];
	}
	[connectionData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Connection Finished!");
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSString *responseString = [[NSString alloc] initWithData:connectionData encoding:NSUTF8StringEncoding];
	[connectionData release];
	parsedJson = [parser objectWithString:responseString];
	[responseString release];
	[parser release];
	[self setDetails];
}

- (void)setDetails {
	url = [parsedJson valueForKey:@"url"];
	avatarURL = [parsedJson valueForKey:@"avatar_url"];
	location = [parsedJson valueForKey:@"location"];
	twitter = [parsedJson valueForKey:@"twitter_screen_name"];
	drafter = [parsedJson valueForKey:@"drafted_by_player_id"];
	shots = (int)[parsedJson valueForKey:@"shots_count"];
	draftees = (int)[parsedJson valueForKey:@"draftees_count"];
	followers = (int)[parsedJson valueForKey:@"followers_count"];
	following = (int)[parsedJson valueForKey:@"following_count"];
	commentsCount = (int)[parsedJson valueForKey:@"comments_count"];
	commentsReceived = (int)[parsedJson valueForKey:@"comments_received_count"];
	likesCount = (int)[parsedJson valueForKey:@"likes_count"];
	likesReceived = (int)[parsedJson valueForKey:@"likes_received_count"];
	reboundsCount = (int)[parsedJson valueForKey:@"rebounds_count"];
	reboundsReceived = (int)[parsedJson valueForKey:@"rebounds_received_count"];
	creationDate = [parsedJson valueForKey:@"created_at"];
}

@end
