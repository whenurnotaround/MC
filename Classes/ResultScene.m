//
//  ResultScene.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "ResultScene.h"


@implementation Result

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Result *layer = [Result node];
	
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
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"witchorb.png"];
		[backgroundImage setPosition:ccp(160,240)];
		[self addChild:backgroundImage z:0];
		
		
		// showing the card
		CCSprite *selected_card = [CCSprite spriteWithFile:[[Manager sharedInstance] selected_card_filename]];
		[selected_card setOpacity:0];
		[selected_card runAction:[CCFadeIn actionWithDuration:10]];
		selected_card.position = ccp(160,240);
		[self addChild:selected_card];
		
		// setup menu
		[self setupMenu];
	}
	return self;
}

-(void) setupMenu {
	
	CCMenuItemImage *replyBtn = [CCMenuItemImage itemFromNormalImage:@"play-again.png" selectedImage:@"play-again.png" target:self selector:@selector(replay:)];
	//CCMenuItemImage *quitBtn = [CCMenuItemImage itemFromNormalImage:@"quit.png" selectedImage:@"quit.png" target:self selector:@selector(endGame:)];
	
			
	CCMenu *menu = [CCMenu menuWithItems:replyBtn, nil];
	
	replyBtn.position = ccp(-80, -200);
	//quitBtn.position = ccp(80, -200);
	
	
	[self addChild:menu];
	
}

-(void)replay:(id)sender {
	NSLog(@"Go To MenuScene");
	//[MC_ProjAppDelegate resetVar];
	//[MC_ProjAppDelegate playEffect:CBEffectClick];
	
	
	[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:1 scene:[Menu scene]]];
	
	[[Manager sharedInstance] resetGameValue];
	
	
	
}

-(void)endGame:(id)sender {
	NSLog(@"End game");
	[[CCDirector sharedDirector] end];
}



@end
