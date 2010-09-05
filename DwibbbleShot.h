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
