//
//  DwibbbleComment.h
//  Swish
//
//  Created by Joshua Lee Tucker on 13/11/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DwibbbleRequest.h"
#import "DwibbbleParser.h"

@protocol DwibbbleCommentDelegate
- (void)receivedComments:(NSMutableArray *)comments;
@end


@interface DwibbbleComment : NSObject {
	id delegate;
	int count;
	int page;
	NSString *shotID;
	NSString *commentID;
	NSString *body;
	NSString *likesCount;
	NSString *playerInfo;
	NSArray *parsedData;
	DwibbbleRequest *request;
	DwibbbleParser *parser;
	NSMutableArray *cluster;
}

- (void)getCommentWithShot:(NSString*)shotID;

@property (nonatomic, assign) id delegate;

@property (readonly) NSString *commentID;
@property (readonly) NSString *body;
@property (readonly) NSString *likesCount;
@property (readonly) NSString *playerInfo;

@end
