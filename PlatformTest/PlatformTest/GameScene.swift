//
//  GameScene.swift
//  PlatformTest
//
//  Created by Maetschl on 21-04-17.
//  Copyright © 2017 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var up1 : SKSpriteNode!
    private var down1 : SKSpriteNode!
    private var down2 : SKSpriteNode!
    private var player : SKSpriteNode!
    private var down : Bool! = true
    
    override func didMove(to view: SKView) {
        up1 = self.childNode(withName: "up1") as! SKSpriteNode
        down1 = self.childNode(withName: "down1") as! SKSpriteNode
        down2 = self.childNode(withName: "down2") as! SKSpriteNode
        player = self.childNode(withName: "player") as! SKSpriteNode
        up1.physicsBody?.categoryBitMask = 0b0001 // Mask for UoPlatforms
        down1.physicsBody?.categoryBitMask = 0b0010 // Mask for downPlatforms
        down2.physicsBody?.categoryBitMask = 0b0010 // Same mask
    }
    
    override func sceneDidLoad() {
        let a = self
        debugPrint(self)
        debugPrint("TEST")
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.physicsBody?.collisionBitMask = 0b0000 // Reset the mask
        
        // For UP only Platform
        if (player.physicsBody?.velocity.dy)! < CGFloat(0.0) {
            player.physicsBody?.collisionBitMask |= 0b0001 // The pipe | operator adds the mask by binary operations
        }

        // For Down only platforms
        if (player.physicsBody?.velocity.dy)! > CGFloat(0.0) {
            player.physicsBody?.collisionBitMask |= 0b0010  // The pipe | operator adds the mask by binary operations
        }
        
    }
    
}
