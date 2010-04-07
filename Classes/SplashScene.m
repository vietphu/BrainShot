//
//  SplashScene.m
//  BrainShot
//
//  Created by  saberma on 10-4-7.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashScene.h"


@implementation SplashScene

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
    CCSprite *splash = [CCSprite spriteWithFile:@"DefaultRotate.png"];
    [splash setPosition:ccp(240, 160)];
    
    CCLabel *tipLabel = [CCLabel labelWithString:NSLocalizedString(@"touch", nil) fontName:@"Marker Felt" fontSize:24];
    [tipLabel setPosition:ccp(130, 50)];
    
    CCLayer *layer = [CCLayer node];
    [layer addChild:splash];
    [layer addChild:tipLabel];
    
    [self addChild:layer];
    
    id action = [CCSequence actions:[CCHide action],[CCDelayTime actionWithDuration:0.5f], [CCShow action],[CCDelayTime actionWithDuration:0.5f], nil]; 
    [tipLabel runAction:[CCRepeatForever actionWithAction:action]];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
  [[CCDirector sharedDirector] replaceScene: [LevelScene node]];
	return NO;
}

- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}	

@end