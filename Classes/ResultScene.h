//
//  ResultScene.h
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Manager.h"
#import "MenuScene.h"

@interface Result : CCLayer {
	NSTimer *timer;

}

+(id) scene;

-(void) setupMenu:(id)sender;
-(void)replay:(id)sender ;
-(void)endGame:(id)sender ;

@end
