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
@synthesize title;
@synthesize url;
@synthesize imageURL;
@synthesize teaserURL;
@synthesize viewsCount;
@synthesize likesCount;
@synthesize commentsCount;
@synthesize reboundsCount;
@synthesize creationDate;

#pragma mark DwibbbleShot Methods

- (void)getShotWithID:(int)shot {
	shotID = shot;
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/shots/%i", shot];
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)setDetails {
	title = [parsedData valueForKey:@"title"];
	url = [parsedData valueForKey:@"url"];
	imageURL = [parsedData valueForKey:@"image_url"];
	teaserURL = [parsedData valueForKey:@"image_teaser_url"];
	viewsCount = (int)[parsedData valueForKey:@"views_count"];
	likesCount = (int)[parsedData valueForKey:@"likes_count"];
	commentsCount = (int)[parsedData valueForKey:@"comments_count"];
	reboundsCount = (int)[parsedData valueForKey:@"rebounds_count"];
	NSLog(@"We just set all the shot details...");
	[self.delegate receivedShot:self];
}

#pragma mark DwibbbleRequest Delegate Methods

- (void)receivedDataFromConnection:(NSMutableData *)data {
	NSLog(@"Houston, the request has returned to base!");
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
