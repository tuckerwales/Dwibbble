//
//  DwibbbleShot.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleShot.h"
#import "JSON.h"

@implementation DwibbbleShot

@synthesize delegate;
<<<<<<< HEAD
@synthesize shotID;
@synthesize title;
@synthesize url;
@synthesize imageURL;
@synthesize teaserURL;
@synthesize viewsCount;
@synthesize likesCount;
@synthesize commentsCount;
@synthesize reboundsCount;
@synthesize creationDate;
=======
>>>>>>> ef4676631daa31a6fad007a21346d9189368b811

- (void)getShotWithID:(int)shot {
	shotID = shot;
	NSLog(@"We're here!");
	NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.dribbble.com/shots/%i", shot]];
	NSURLRequest *req = [NSURLRequest requestWithURL:requestURL];
	[NSURLConnection connectionWithRequest:req delegate:self];
}

#pragma mark Instance Variable Getters

- (int)shotID {
	return shotID;
}

- (NSString *)title {
	return title;
}

- (NSString *)url {
	return url;
}

- (NSString *)imageURL {
	return imageURL;
}

- (NSString *)teaserURL {
	return teaserURL;
}

- (int)viewsCount {
	return viewsCount;
}

- (int)likesCount {
	return likesCount;
}

- (int)commentsCount {
	return commentsCount;
}

- (int)reboundsCount {
	return reboundsCount;
}

- (NSString *)creationDate {
	return creationDate;
}

#pragma mark Connection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
	NSLog(@"Receiving data...");
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
	title = [parsedJson valueForKey:@"title"];
	url = [parsedJson valueForKey:@"url"];
	imageURL = [parsedJson valueForKey:@"image_url"];
	teaserURL = [parsedJson valueForKey:@"image_teaser_url"];
	viewsCount = (int)[parsedJson valueForKey:@"views_count"];
	likesCount = (int)[parsedJson valueForKey:@"likes_count"];
	commentsCount = (int)[parsedJson valueForKey:@"comments_count"];
	reboundsCount = (int)[parsedJson valueForKey:@"rebounds_count"];
	NSLog(@"We just set all the shot details...");
}

@end
