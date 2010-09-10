//
//  ProceedScene.h
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Manager.h"
#import "GenderScene.h"
#import "SimpleAudioEngine.h"

@interface Proceed : CCLayer {

}

+(id) scene;

-(void) setupMenu;
-(void)renderGenderScene;
@end
