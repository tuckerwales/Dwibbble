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
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:data error:&error];
	[self.delegate finishedParsing:dictionary];
}

@end
