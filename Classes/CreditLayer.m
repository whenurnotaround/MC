//
//  CreditLayer.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/11/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "CreditLayer.h"


@implementation CreditLayer
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"white-bg.png"];
		[self addChild:backgroundImage z:0];
		[backgroundImage setPosition:ccp(160,240)];
		
		CCSprite *logoImage = [CCSprite spriteWithFile:@"xinnixsoft-logo.png"];
		[self addChild:logoImage z:1];
		[logoImage setPosition:ccp(160,240)];
		
		
		
		//CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Back" 
//															target:self selector:@selector(backToMenu:)];
//		
		
		//CCMenu *creditMenu = [CCMenu menuWithItems:back, nil];
//		
//		[creditMenu alignItemsVertically];
//		[creditMenu setPosition:ccp(160,80)];
//		[self addChild:creditMenu];
//		
		label =	[CCLabel labelWithString:@"http://www.xinnixsoft.com" fontName:@"Marker felt" fontSize:15];
		label.color = ccc3(60,60,60);
		[label setPosition:ccp(160,300)];
		
		[self addChild:label];
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self 
														 priority:0 swallowsTouches:YES];
		
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	
	return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	
	[[CCDirector sharedDirector] popScene];
	
}

- (void) backToMenu: (CCMenuItem *) menuItem {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[CCDirector sharedDirector] popScene];
}

- (void) dealloc {
	[super dealloc];
	
}

@end
