//
//  DwibbbleParser.h
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJSONDeserializer.h"

@protocol DwibbbleParserDelegate
- (void)finishedParsing:(NSDictionary *)parsedJSON;
@end


@interface DwibbbleParser : NSObject {
	id delegate;
	NSDictionary *parsed;
}

@property (nonatomic, assign) id delegate;

- (void)parseWithData:(NSMutableData *)data;

@end
