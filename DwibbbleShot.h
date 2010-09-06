//
//  DwibbbleShot.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DwibbbleShot;

@protocol DwibbbleShotDelegate
@required
- (void)receivedShot:(DwibbbleShot *)shot;
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
	NSMutableData *connectionData;
	NSArray *parsedJson;
}

@property (nonatomic, assign) id delegate;

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

- (int)shotID;
- (NSString *)title;
- (NSString *)url;
- (NSString *)imageURL;
- (NSString *)teaserURL;
- (int)viewsCount;
- (int)likesCount;
- (int)commentsCount;
- (int)reboundsCount;
- (NSString *)creationDate;
- (void)setDetails;

@end
