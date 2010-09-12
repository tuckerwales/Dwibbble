//
//  DwibbbleList.h
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DwibbbleRequest.h"
#import "DwibbbleParser.h"

@interface DwibbbleList : NSObject {
	NSMutableDictionary *parsedData;
	DwibbbleRequest *request;
	DwibbbleParser *parser;
}

@end
