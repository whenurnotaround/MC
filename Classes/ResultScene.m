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
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"witchorb_h_flip.png"];
		[backgroundImage setPosition:ccp(160,240)];
		[self addChild:backgroundImage z:0];
		
		// setup menu
		
		
		
		
		timer = [NSTimer scheduledTimerWithTimeInterval: 2
												 target: self
											   selector: @selector(showResult:)
											   userInfo: nil
												repeats: NO];
		
		
		
		
		
	}
	return self;
}

- (void) showResult:(id)sender{
	// showing the card
	[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
	[[SimpleAudioEngine sharedEngine] playEffect:@"result.mp3"];
	
	CCSprite *selected_card = [CCSprite spriteWithFile:[[Manager sharedInstance] selected_card_filename]];
	[selected_card setOpacity:0];
	[selected_card runAction:[CCFadeIn actionWithDuration:5]];
	selected_card.position = ccp(160,240);
	[self addChild:selected_card];
	
	
	
	//[self setupMenu];
	
	[NSTimer scheduledTimerWithTimeInterval: 3.5
									 target: self
								   selector: @selector(setupMenu:)
								   userInfo: nil
									repeats: NO];
}

-(void) setupMenu:(id)sender {
	
	CCMenuItemImage *replyBtn = [CCMenuItemImage itemFromNormalImage:@"play-again.png" selectedImage:@"play-again.png" target:self selector:@selector(replay:)];
	//CCMenuItemImage *quitBtn = [CCMenuItemImage itemFromNormalImage:@"quit.png" selectedImage:@"quit.png" target:self selector:@selector(endGame:)];
	
			
	CCMenu *menu = [CCMenu menuWithItems:replyBtn, nil];
	
	replyBtn.position = ccp(120, -200);
	//quitBtn.position = ccp(80, -200);
	
	
	[self addChild:menu];
	
}

-(void)replay:(id)sender {
	NSLog(@"Go To MenuScene");
	[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgMusic.mp3"];
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	
	[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:1 scene:[Menu scene]]];
	
	
	[[Manager sharedInstance] resetGameValue];
	
	
	
}

-(void)endGame:(id)sender {
	NSLog(@"End game");
	[[CCDirector sharedDirector] end];
}

-(void) dealloc {
	[super dealloc];
}



@end
