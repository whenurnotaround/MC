//
//  GenderScene.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "GenderScene.h"


@implementation Gender

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Gender *layer = [Gender node];
	
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
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"gender.png"];
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
	
	CCMenuItemImage *maleBtn1 = [CCMenuItemImage itemFromNormalImage:@"male1.png" selectedImage:@"male1.png" target:self selector:@selector(gender1:)];
	
	CCMenuItemImage *maleBtn2 = [CCMenuItemImage itemFromNormalImage:@"male2.png" selectedImage:@"male2.png" target:self selector:@selector(gender2:)];
	
	CCMenuItemImage *maleBtn3 = [CCMenuItemImage itemFromNormalImage:@"male3.png" selectedImage:@"male3.png" target:self selector:@selector(gender3:)];

	CCMenuItemImage *maleBtn4 = [CCMenuItemImage itemFromNormalImage:@"male4.png" selectedImage:@"male4.png" target:self selector:@selector(gender4:)];

	
	CCMenuItemImage *femaleBtn1 = [CCMenuItemImage itemFromNormalImage:@"female1.png" selectedImage:@"female1.png" target:self selector:@selector(gender1:)];
	
	CCMenuItemImage *femaleBtn2 = [CCMenuItemImage itemFromNormalImage:@"female2.png" selectedImage:@"female2.png" target:self selector:@selector(gender2:)];
	
	CCMenuItemImage *femaleBtn3 = [CCMenuItemImage itemFromNormalImage:@"female3.png" selectedImage:@"female3.png" target:self selector:@selector(gender3:)];

	CCMenuItemImage *femaleBtn4 = [CCMenuItemImage itemFromNormalImage:@"female4.png" selectedImage:@"female4.png" target:self selector:@selector(gender4:)];
	
	
	CCMenu *genderMenu = [CCMenu menuWithItems:maleBtn1, maleBtn2, maleBtn3, maleBtn4, femaleBtn1, femaleBtn2, femaleBtn3, femaleBtn4, nil];
	
	maleBtn1.position = ccp(-90,32);
	maleBtn2.position = ccp(-52, 32);
	maleBtn3.position = ccp(-52, -32);
	maleBtn4.position = ccp(-90, -32);
	
	femaleBtn1.position = ccp(52,32);
	femaleBtn2.position = ccp(90, 32);
	femaleBtn3.position = ccp(90, -31.5);
	femaleBtn4.position = ccp(52, -31.5);
	
	[self addChild:genderMenu];
	
}

-(void)gender1:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:0];
	[[Manager sharedInstance] setCardHint_no:2];
	
	[self renderStatusScene];
}
-(void)gender2:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:4];
	[[Manager sharedInstance] setCardHint_no:3];	
	
	[self renderStatusScene];
}
-(void)gender3:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:8];
	[[Manager sharedInstance] setCardHint_no:4];	
	
	[self renderStatusScene];
}
-(void)gender4:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	[[Manager sharedInstance] setSelected_card:13];
	[[Manager sharedInstance] setCardHint_no:1];
	
	[[Manager sharedInstance] setKing_isSelected:TRUE];
	
	[self renderStatusScene];
}

-(void)renderStatusScene{
	
	[[Manager sharedInstance] print_selected_card];
	
	NSLog(@"Go To StatusScene");
	//[MC_ProjAppDelegate playEffect:CBEffectClick];
	
	[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:1 scene:[Status scene]]];
	
}

@end
