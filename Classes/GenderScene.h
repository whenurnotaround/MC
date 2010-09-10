//
//  GenderScene.h
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "Manager.h"
#import "StatusScene.h"

@interface Gender : CCLayer {

}
+(id) scene;

-(void) setupMenu;
-(void)renderStatusScene;
@end
