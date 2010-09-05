//
//  iOS__Dwibbble_AppDelegate.h
//  iOS (Dwibbble)
//
//  Created by Joshua Lee Tucker on 05/09/2010.
//  Copyright Stunnify 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iOS__Dwibbble_ViewController;

@interface iOS__Dwibbble_AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iOS__Dwibbble_ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iOS__Dwibbble_ViewController *viewController;

@end

