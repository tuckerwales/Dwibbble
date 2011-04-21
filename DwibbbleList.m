//
//  DwibbbleList.m
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleList.h"


@implementation DwibbbleList

@synthesize delegate;

- (void)getListWithType:(NSString *)type {
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/%@", type];
	if (request != NULL) {
		request = NULL;
	}
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)receivedDataFromConnection:(NSMutableData *)data {
	NSLog(@"received!");
	if (parser != NULL) {
		[parser release];
	}
	parser = [[DwibbbleParser alloc] init];
	parser.delegate = self;
	[parser parseWithData:data];
}

- (void)receivedErrorFromConnection:(NSString *)error {
	NSLog(@"Error: %@", error);
}

#pragma mark DwibbbleParser Delegate Methods

- (void)finishedParsing:(NSDictionary *)parsedJSON {
	if (cluster != NULL) {
		[cluster release];
	}
	cluster = [[NSMutableArray alloc] init];
	int count;
	for (count = 0; count < [[parsedJSON valueForKey:@"shots"] count]; count++) {
		DwibbbleShot *shot = [[DwibbbleShot alloc] init];
		[shot setDetailsWithData:[[parsedJSON objectForKey:@"shots"] objectAtIndex:count]];
		[cluster addObject:shot];
	}
	[self.delegate receivedList:cluster];
}

@end
