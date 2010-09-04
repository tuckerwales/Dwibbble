//
//  DwibbbleShot.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleShot.h"


@implementation DwibbbleShot

- (int)shotID {
	return shotID;
}

- (NSString *)title {
	return title;
}

- (NSString *)url {
	return url;
}

- (NSString *)imageURL {
	return imageURL;
}

- (NSString *)teaserURL {
	return teaserURL;
}

- (int)viewsCount {
	return viewsCount;
}

- (int)likesCount {
	return likesCount;
}

- (int)commentsCount {
	return commentsCount;
}

- (int)reboundsCount {
	return reboundsCount;
}

- (NSString *)creationDate {
	return creationDate;
}

- (DwibbblePlayer *)player {
	DwibbblePlayer *p = [[DwibbblePlayer alloc] initWithPlayerID:];
	return p;
}

@end
