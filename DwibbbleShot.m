//
//  DwibbbleShot.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleShot.h"

@implementation DwibbbleShot

@synthesize delegate;
@synthesize shotID;
@synthesize shotTitle;
@synthesize url;
@synthesize shortURL;
@synthesize imageURL;
@synthesize teaserURL;
@synthesize username;
@synthesize viewsCount;
@synthesize likesCount;
@synthesize commentsCount;
@synthesize reboundsCount;
@synthesize creationDate;
@synthesize playerInfo;

#pragma mark DwibbbleShot Methods

- (void)getShotWithID:(int)shot {
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/shots/%i", shot];
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)setDetails {
	shotTitle = [[parsedData valueForKey:@"title"] retain];
	url = [[parsedData valueForKey:@"url"] retain];
	shortURL = [[parsedData valueForKey:@"short_url"] retain];
	imageURL = [[parsedData valueForKey:@"image_url"] retain];
	teaserURL = [[parsedData valueForKey:@"image_teaser_url"] retain];
	username = [[parsedData valueForKey:@"username"] retain];
	viewsCount = [[parsedData valueForKey:@"views_count"] retain];
	likesCount = [[parsedData valueForKey:@"likes_count"] retain];
	commentsCount = [[parsedData valueForKey:@"comments_count"] retain];
	reboundsCount = [[parsedData valueForKey:@"rebounds_count"] retain];
	playerInfo = [[parsedData valueForKey:@"player"] retain];
	[self.delegate receivedShot:self];
}

- (void)setDetailsWithData:(id)data {
	shotID = [[data valueForKey:@"id"] retain];
	imageURL = [[data valueForKey:@"image_url"] retain];
	shotTitle = [[data valueForKey:@"title"] retain];
	url = [[data valueForKey:@"url"] retain];
	shortURL = [[data valueForKey:@"short_url"] retain];
	teaserURL = [[data valueForKey:@"image_teaser_url"] retain];
	username = [[data valueForKey:@"username"] retain];
	viewsCount = [[data valueForKey:@"views_count"] retain];
	likesCount = [[data valueForKey:@"likes_count"] retain];
	commentsCount = [[data valueForKey:@"comments_count"] retain];
	reboundsCount = [[data valueForKey:@"rebounds_count"] retain];
	playerInfo = [[data valueForKey:@"player"] retain];
	[self.delegate receivedShot:self];
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
	[parsedData release];
	parsedData = parsedJSON;
	[self setDetails];
}

@end
