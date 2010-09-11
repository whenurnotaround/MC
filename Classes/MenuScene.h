//
//  MenuScene.h
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

#import "ProceedScene.h"
#import "TutorialLayer.h"
#import "CreditLayer.h"

@interface Menu : CCLayer {
	//CCMenu *muteMenu;
	CCMenuItemImage *mute;
	CCMenuItemImage *unmute;
}

+(id) scene;

-(void) setUpMenus;
@end
