//
//  DwibbbleRequest.h
//  
//
//  Created by Joshua Lee Tucker on 11/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DwibbbleRequestDelegate
- (void)receivedDataFromConnection:(NSMutableData *)data;
- (void)receivedErrorFromConnection:(NSString *)error;
@end


@interface DwibbbleRequest : NSObject {
	id delegate;
	NSMutableData *connectionData;
}

@property (nonatomic, assign) id delegate;

- (void)requestWithURL:(NSString *)url;

@end
