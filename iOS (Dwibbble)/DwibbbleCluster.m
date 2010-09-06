//
//  DwibbbleCluster.m
//  
//
//  Created by Joshua Lee Tucker on 04/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "DwibbbleCluster.h"


@implementation DwibbbleCluster

- (NSString *)classType {
	return [NSString stringWithFormat:@"%@", [[self objectAtIndex:0] class]];
}

@end
