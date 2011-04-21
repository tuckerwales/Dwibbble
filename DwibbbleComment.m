//
//  DwibbbleComment.m
//  Swish
//
//  Created by Joshua Lee Tucker on 13/11/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleComment.h"


@implementation DwibbbleComment

@synthesize delegate;

@synthesize commentID;
@synthesize body;
@synthesize likesCount;
@synthesize playerInfo;

- (id)init {
	self = [super init];
	page = 1;
	cluster = [[NSMutableArray alloc] init];
	return self;
}

- (void)getCommentWithShot:(NSString*)shot {
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/shots/%@/comments?page=%i", shotID, page];
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)getCommentWithShot:(NSString*)shot andCount:(NSString *)commentCount {
	shotID = shot;
	count = [commentCount integerValue];
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/shots/%@/comments?page=%i", shotID, page];
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)setDetailsWithData:(id)data {
	commentID = [[data valueForKey:@"id"] retain];
	body = [[data valueForKey:@"body"] retain];
	likesCount = [[data valueForKey:@"likesCount"] retain];
	playerInfo = [[data valueForKey:@"player"] retain];
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
	int cnt;
	for (cnt = 0; cnt < [[parsedJSON valueForKey:@"comments"] count]; cnt++) {
		DwibbbleComment *comment = [[DwibbbleComment alloc] init];
		[comment setDetailsWithData:[[parsedJSON valueForKey:@"comments"] objectAtIndex:cnt]];
		[cluster addObject:comment];
	}
	if ([cluster count] < count) {
		page++;
		[self getCommentWithShot:shotID];
	} else {
	[self.delegate receivedComments:cluster];
	}
}


@end
