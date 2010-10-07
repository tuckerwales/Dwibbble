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

// Shots
#import "DwibbbleShot.h"

@protocol DwibbbleListDelegate
@required
- (void)receivedList:(NSMutableArray *)list;
@end


@interface DwibbbleList : NSObject {
	id delegate;
	DwibbbleRequest *request;
	DwibbbleParser *parser;
	NSMutableArray *cluster;
}

@property (nonatomic, assign) id delegate;

- (void)getListWithType:(NSString *)type;

@end
