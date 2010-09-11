//
//  MenuScene.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "MenuScene.h"


@implementation Menu

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Menu *layer = [Menu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"witch.png"];
		[self addChild:backgroundImage z:0];
		[backgroundImage setPosition:ccp(160,240)];
		[self setUpMenus];
		
		
	}
	return self;
}

- (void) setUpMenus {
	CCMenuItemFont *startMenu = [CCMenuItemFont itemFromString:@"Start Game" 
														target:self selector:@selector(startGame:)];
	
	CCMenuItemFont *helpMenu = [CCMenuItemFont itemFromString:@"How to play" 
													   target:self selector:@selector(helpGame:)];
	
	CCMenuItemFont *creditMenu = [CCMenuItemFont itemFromString:@"Credits" 
														 target:self selector:@selector(creditGame:)];
	
	CCMenu *gameMenu = [CCMenu menuWithItems:startMenu, helpMenu, creditMenu, nil];
	
	
	[gameMenu alignItemsVertically];
	[gameMenu setPosition:ccp(160,80)];
	[self addChild:gameMenu];
	
	
	//////// sound menu ////////
	

}


- (void) startGame: (CCMenuItem *) menuItem {
	NSLog(@"Game started");
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	// call the next scene
	[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:2 scene:[Proceed scene]]];
}

- (void) helpGame: (CCMenuItem *) menuItem {
	NSLog(@"Tutorial");
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	CCScene *tutorial_scene = [CCScene node];
	
	TutorialLayer * ssl = [TutorialLayer node];
	
	// Set positions for the background and labels.
	// Generally you'll be using full screen backgrounds
	// (screenshots), and positioning them at the center.
	[ssl setBackgroundXPosition:160];
	[ssl setBackgroundYPosition:245];
	[ssl setDescriptionXPosition: 150];
	[ssl setDescriptionYPosition: 100];
	[ssl setDescriptionWidth:100];
	[ssl setDescriptionHeight:300];
	[ssl setFontName:@"Helvetica"];      // optional
	[ssl setFontSize:24];                // optional
	
	// Add slides in order they appear.
	
	[ssl addSlideWithBackground:@"t_3_001.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_3_002.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_3_003.png" andDescription:@""];
	
	[ssl addSlideWithBackground:@"t_1_001.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_1_002.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_1_003.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_1_004_0.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_1_004_1.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_1_004_2.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_1_005.png" andDescription:@""];
	
	[ssl addSlideWithBackground:@"t_2_001.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_2_002.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_2_003.png" andDescription:@""];
	[ssl addSlideWithBackground:@"t_2_004.png" andDescription:@""];
	
	
	// Start and display the slide show.
	[ssl displayFirstSlide];
	[tutorial_scene addChild:ssl];
	[[CCDirector sharedDirector] pushScene:tutorial_scene];
}

- (void) creditGame: (CCMenuItem *) menuItem {
	NSLog(@"Game option");
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	CCScene *creditScene = [CCScene node];
	CreditLayer * creditLayer = [CreditLayer node];
	
	[creditScene addChild:creditLayer];
	[[CCDirector sharedDirector] pushScene:creditScene];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
