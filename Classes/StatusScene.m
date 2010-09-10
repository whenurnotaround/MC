//
//  StatusScene.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "StatusScene.h"


@implementation Status

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Status *layer = [Status node];
	
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
		CCSprite *backgroundImage = [CCSprite spriteWithFile:@"status.png"];
		[backgroundImage setPosition:ccp(160,240)];
		[self addChild:backgroundImage z:0];
		
		
		// add hit at the corners
		// this time we need to select whcih hit should be show up
		// in this case just show set1.
		NSLog(@"card hint file name  = %@",[[Manager sharedInstance] cardHint_filename]);
		CCSprite *cardSet = [CCSprite spriteWithFile:[[Manager sharedInstance] cardHint_filename]];
		[cardSet setPosition:ccp(160,240)];
		[self addChild:cardSet z:1];
		
		
		// setup menu
		[self setupMenu];
	}
	return self;
}

-(void) setupMenu {
	
	CCMenuItemImage *singleBtn1 = [CCMenuItemImage itemFromNormalImage:@"single1.png" selectedImage:@"single1.png" target:self selector:@selector(status1:)];
	
	CCMenuItemImage *singleBtn2 = [CCMenuItemImage itemFromNormalImage:@"single2.png" selectedImage:@"single2.png" target:self selector:@selector(status2:)];
	
	CCMenuItemImage *singleBtn3 = [CCMenuItemImage itemFromNormalImage:@"single3.png" selectedImage:@"single3.png" target:self selector:@selector(status3:)];
	
	CCMenuItemImage *singleBtn4 = [CCMenuItemImage itemFromNormalImage:@"single4.png" selectedImage:@"single4.png" target:self selector:@selector(status4:)];
	
	
	CCMenuItemImage *marriedBtn1 = [CCMenuItemImage itemFromNormalImage:@"married1.png" selectedImage:@"married1.png" target:self selector:@selector(status1:)];
	
	CCMenuItemImage *marriedBtn2 = [CCMenuItemImage itemFromNormalImage:@"married2.png" selectedImage:@"married2.png" target:self selector:@selector(status2:)];
	
	CCMenuItemImage *marriedBtn3 = [CCMenuItemImage itemFromNormalImage:@"married3.png" selectedImage:@"married3.png" target:self selector:@selector(status3:)];
	
	CCMenuItemImage *marriedBtn4 = [CCMenuItemImage itemFromNormalImage:@"married4.png" selectedImage:@"married4.png" target:self selector:@selector(status4:)];
	
	
	CCMenu *statusMenu = [CCMenu menuWithItems:singleBtn1, singleBtn2, singleBtn3, singleBtn4, marriedBtn1, marriedBtn2, marriedBtn3, marriedBtn4, nil];
	
	singleBtn1.position = ccp(-90,32);
	singleBtn2.position = ccp(-52, 32);
	singleBtn3.position = ccp(-52, -32);
	singleBtn4.position = ccp(-90, -32);
	
	marriedBtn1.position = ccp(52,32);
	marriedBtn2.position = ccp(90, 32);
	marriedBtn3.position = ccp(90, -32);
	marriedBtn4.position = ccp(52, -32);
	
	[self addChild:statusMenu];
	
}

-(void)status1:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	if(![[Manager sharedInstance] King_isSelected]){
		NSLog(@"innnnn");
		[[Manager sharedInstance] setSelected_card:1];
		
	}
	
	[self renderResultScene];
}
-(void)status2:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	if(![[Manager sharedInstance] King_isSelected]){
				NSLog(@"innnnn");
		[[Manager sharedInstance] setSelected_card:2];
		
	}
	[self renderResultScene];
}
-(void)status3:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	if(![[Manager sharedInstance] King_isSelected]){
				NSLog(@"innnnn");
		[[Manager sharedInstance] setSelected_card:3];
		
	}
	[self renderResultScene];
}
-(void)status4:(id)sender {
	[[SimpleAudioEngine sharedEngine] playEffect:@"buttonClick.caf"];
	if(![[Manager sharedInstance] King_isSelected]){
				NSLog(@"innnnn");
		[[Manager sharedInstance] setSelected_card:4];
		
	}
	[self renderResultScene];
}
-(void)renderResultScene {
	//[MC_ProjAppDelegate playEffect:CBEffectClick];
//	
//	LastScene *ls =[LastScene node];
//	
	[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:1 scene:[Result scene]]];
//	
	NSLog(@"Go To ResultScene");
}


@end
