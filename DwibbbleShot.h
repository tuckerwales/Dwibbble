//
//  DwibbbleShot.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DwibbbleRequest.h"
#import "DwibbbleParser.h"

@class DwibbbleShot;

@protocol DwibbbleShotDelegate
@required
- (void)receivedShot:(DwibbbleShot *)shot;
- (void)receivedError:(NSString *)error;
@end


@interface DwibbbleShot : NSObject {
	id		delegate;
	NSString *shotID;
	NSString *shotTitle;
	NSString *url;
	NSString *imageURL;
	NSString *teaserURL;
	NSString *username;
	NSString *viewsCount;
	NSString *likesCount;
	NSString *commentsCount;
	NSString *reboundsCount;
	NSString *creationDate;
	NSString *playerInfo;
	NSArray *parsedData;
	DwibbbleRequest *request;
	DwibbbleParser *parser;
}

@property (nonatomic, assign) id delegate;

// Generate getters and setters

@property (readonly) NSString *shotID;
@property (readonly) NSString *shotTitle;
@property (readonly) NSString *url;
@property (readonly) NSString *imageURL;
@property (readonly) NSString *teaserURL;
@property (readonly) NSString *username;
@property (readonly) NSString *viewsCount;
@property (readonly) NSString *likesCount;
@property (readonly) NSString *commentsCount;
@property (readonly) NSString *reboundsCount;
@property (readonly) NSString *creationDate;
@property (readonly) NSString *playerInfo;

- (void)getShotWithID:(int)shot;
- (void)setDetails;
- (void)setDetailsWithData:(id)data;

@end
