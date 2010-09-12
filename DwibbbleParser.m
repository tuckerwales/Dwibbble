//
//  DwibbbleParser.m
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleParser.h"


@implementation DwibbbleParser

@synthesize delegate;

- (void)parseWithData:(NSMutableData *)data {
	parser = [[SBJsonParser alloc] init];
	NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	parsed = [parser objectWithString:dataString];
	[data release];
	[dataString release];
	[parser release];
	[self.delegate finishedParsing:parsed];
}

@end
