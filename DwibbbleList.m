//
//  DwibbbleList.m
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleList.h"


@implementation DwibbbleList

- (void)start {
	NSString *reqURL = [NSString stringWithFormat:@"http://api.dribbble.com/shots/popular"];
	request = [[DwibbbleRequest alloc] init];
	request.delegate = self;
	[request requestWithURL:reqURL];
}

- (void)receivedDataFromConnection:(NSMutableData *)data {
	parser = [[DwibbbleParser alloc] init];
	parser.delegate = self;
	[parser parseWithData:data];
}

- (void)receivedErrorFromConnection:(NSString *)error {
	NSLog(@"Error: %@", error);
}

#pragma mark DwibbbleParser Delegate Methods

- (void)finishedParsing:(NSMutableDictionary *)parsedJSON {
	NSLog(@"Class: %@", [parsedJSON class]);
	NSLog(@"Object: %@", [parsedJSON objectForKey:@"total"]);
	NSLog(@"Shots: %@", [parsedJSON objectForKey:@"shots"]);
}

@end
