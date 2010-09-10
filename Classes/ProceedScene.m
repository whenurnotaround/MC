//
//  ProceedScene.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "ProceedScene.h"


@implementation Proceed

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Proceed *layer = [Proceed node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// add background
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"witch.png"];
		[backgroundImage setPosition:ccp(160,240)];
		[self addChild:backgroundImage z:0];
		
		
		// add hit at the corners
		CCSprite *cardSet = [CCSprite spriteWithFile:@"set1.png"];
		[cardSet setPosition:ccp(160,240)];
		[self addChild:cardSet z:1];
		
		
		// setup menu
		[self setupMenu];
	}
	return self;
}

-(void) setupMenu {
	
	CCMenuItemImage *button1 = [CCMenuItemImage itemFromNormalImage:@"proceed1.png" 
													  selectedImage:@"proceed1.png" target:self selector:@selector(proceed1:)];
	
	CCMenuItemImage *button2 = [CCMenuItemImage itemFromNormalImage:@"proceed2.png" 
													  selectedImage:@"proceed2.png" target:self selector:@selector(proceed2:)];

	
	CCMenuItemImage *button3 = [CCMenuItemImage itemFromNormalImage:@"proceed3.png" 
													  selectedImage:@"proceed3.png" target:self selector:@selector(proceed3:)];

	
	CCMenuItemImage *button4 = [CCMenuItemImage itemFromNormalImage:@"proceed4.png" 
													  selectedImage:@"proceed4.png" target:self selector:@selector(proceed4:)];
	
	CCMenu *proceedMenu = [CCMenu menuWithItems:button1, button2, button3, button4, nil];
	
	button1.position = ccp(-46,-140);
	button2.position = ccp(46, -140);
	button3.position = ccp(46, -164);
	button4.position = ccp(-46, -164);
	
	[self addChild:proceedMenu];

}

-(void)proceed1:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:0];
	
	[self renderGenderScene];
}
-(void)proceed2:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:13];
	
	[self renderGenderScene];
}
-(void)proceed3:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:26];
	
	[self renderGenderScene];
}
-(void)proceed4:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:39];
	
	[self renderGenderScene];
}

-(void)renderGenderScene{
	
	[[Manager sharedInstance] print_selected_card];
	
	NSLog(@"Go To GenderScene");
	
	[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:1 scene:[Gender scene]]];
	
	
}


@end
