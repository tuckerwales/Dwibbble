//
//  DwibbbleShot.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
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
	int		shotID;
	NSString *title;
	NSString *url;
	NSString *imageURL;
	NSString *teaserURL;
	int		viewsCount;
	int		likesCount;
	int		commentsCount;
	int		reboundsCount;
	NSString *creationDate;
	NSArray *parsedData;
	DwibbbleRequest *request;
	DwibbbleParser *parser;
}

@property (nonatomic, assign) id delegate;

// Generate getters and setters

@property (readonly) int shotID;
@property (readonly) NSString *title;
@property (readonly) NSString *url;
@property (readonly) NSString *imageURL;
@property (readonly) NSString *teaserURL;
@property (readonly) int viewsCount;
@property (readonly) int likesCount;
@property (readonly) int commentsCount;
@property (readonly) int reboundsCount;
@property (readonly) NSString *creationDate;

- (void)getShotWithID:(int)shot;
- (void)setDetails;

@end
