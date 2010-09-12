//
//  DwibbbleParser.h
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@protocol DwibbbleParserDelegate
- (void)finishedParsing:(NSMutableDictionary *)parsedJSON;
@end


@interface DwibbbleParser : NSObject {
	id delegate;
	NSMutableDictionary *parsed;
	SBJsonParser *parser;
}

@property (nonatomic, assign) id delegate;

- (void)parseWithData:(NSMutableData *)data;

@end
