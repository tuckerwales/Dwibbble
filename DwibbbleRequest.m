//
//  DwibbbleRequest.m
//  
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleRequest.h"


@implementation DwibbbleRequest

@synthesize delegate;

#pragma mark DwibbbleRequest Methods

- (void)requestWithURL:(NSString *)url {
	NSURL *requestURL = [NSURL URLWithString:url];
	NSURLRequest *req = [NSURLRequest requestWithURL:requestURL];
	[NSURLConnection connectionWithRequest:req delegate:self];
}

#pragma mark Connection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
	NSLog(@"Receiving data...");
	if (connectionData == nil) {
		connectionData = [[NSMutableData data] retain];
	}
	[connectionData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Connection Finished!");
	[self.delegate receivedDataFromConnection:connectionData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[self.delegate receivedErrorFromConnection:[error description]];
}

@end
