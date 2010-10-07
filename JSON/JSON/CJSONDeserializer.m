//
//  CJSONDeserializer.m
//  TouchCode
//
//  Created by Jonathan Wight on 12/15/2005.
//  Copyright 2005 toxicsoftware.com. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "CJSONDeserializer.h"

#import "CJSONScanner.h"
#import "CDataScanner.h"

NSString *const kJSONDeserializerErrorDomain  = @"CJSONDeserializerErrorDomain";

@interface CJSONDeserializer ()
@property (nonatomic, retain) NSOperationQueue *operationQueue;
@end

@implementation CJSONDeserializer

@synthesize operationQueue;

+ (id)deserializer
{
return([[[self alloc] init] autorelease]);
}

- (void)dealloc
{
[operationQueue release];
operationQueue = NULL;
//
[super dealloc];
}

#pragma mark -

- (NSOperationQueue *)operationQueue
{
if (operationQueue == NULL)
    {
    operationQueue = [[NSOperationQueue alloc] init];
    }
return(operationQueue);
}

#pragma mark -

- (id)deserialize:(NSData *)inData error:(NSError **)outError
{
if (inData == NULL || [inData length] == 0)
	{
	if (outError)
		*outError = [NSError errorWithDomain:kJSONDeserializerErrorDomain code:-1 userInfo:NULL];

	return(NULL);
	}
CJSONScanner *theScanner = [CJSONScanner scannerWithData:inData];
id theObject = NULL;
if ([theScanner scanJSONObject:&theObject error:outError] == YES)
	return(theObject);
else
	return(NULL);
}

- (id)deserializeAsDictionary:(NSData *)inData error:(NSError **)outError
{
if (inData == NULL || [inData length] == 0)
	{
	if (outError)
		*outError = [NSError errorWithDomain:kJSONDeserializerErrorDomain code:-1 userInfo:NULL];

	return(NULL);
	}
CJSONScanner *theScanner = [CJSONScanner scannerWithData:inData];
NSDictionary *theDictionary = NULL;
if ([theScanner scanJSONDictionary:&theDictionary error:outError] == YES)
	return(theDictionary);
else
	return(NULL);
}

- (id)deserializeAsArray:(NSData *)inData error:(NSError **)outError
{
if (inData == NULL || [inData length] == 0)
	{
	if (outError)
		*outError = [NSError errorWithDomain:kJSONDeserializerErrorDomain code:-1 userInfo:NULL];

	return(NULL);
	}
CJSONScanner *theScanner = [CJSONScanner scannerWithData:inData];
NSArray *theArray = NULL;
if ([theScanner scanJSONArray:&theArray error:outError] == YES)
	return(theArray);
else
	return(NULL);
}

#if NS_BLOCKS_AVAILABLE
- (void)deserializeAsDictionary:(NSData *)inData completionBlock:(void (^)(id result, NSError *error))block {
	
	NSError *noDataError = nil;
	if (inData == NULL || [inData length] == 0) {
		noDataError = [NSError errorWithDomain:kJSONDeserializerErrorDomain code:-1 userInfo:NULL];
		block(nil, noDataError);
	}
	
	[self.operationQueue addOperationWithBlock:^{
		
		NSError *deserializationError = nil;
		CJSONScanner *theScanner = [CJSONScanner scannerWithData:inData];
		NSDictionary *theDictionary = NULL;
		BOOL successful = [theScanner scanJSONDictionary:&theDictionary error:&deserializationError];
		
		dispatch_async(dispatch_get_main_queue (), ^{
			if (successful)
				block(theDictionary, nil);
			else
				block(nil, deserializationError);
		});
	}];
}

- (void)deserializeAsArray:(NSData *)inData completionBlock:(void (^)(id result, NSError *error))block {
	
	NSError *nullInDataError = nil;
	if (inData == NULL || [inData length] == 0) {
		nullInDataError = [NSError errorWithDomain:kJSONDeserializerErrorDomain code:-1 userInfo:NULL];
		block(nil, nullInDataError);
	}
			  
	[self.operationQueue addOperationWithBlock:^{
		
		NSError *deserializationError = nil;
		CJSONScanner *theScanner = [CJSONScanner scannerWithData:inData];
		NSArray *theArray = NULL;
		BOOL successful = [theScanner scanJSONArray:&theArray error:&deserializationError];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			if (successful)
				block(theArray, nil);
			else
				block(nil, deserializationError);
		});
	}];
}
#endif

@end
