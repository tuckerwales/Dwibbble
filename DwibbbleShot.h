//
//  DwibbbleShot.h
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DwibbblePlayer.h"

@interface DwibbbleShot : NSObject {
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

- (DwibbbleShot *)initWithShotID:(int)shot;

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
