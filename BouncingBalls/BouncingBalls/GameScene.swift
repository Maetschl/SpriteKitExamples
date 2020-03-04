//
//  GameScene.swift
//  BouncingBalls
//
//  Created by Julian Arias Maetschl on 04-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var redBall : SKNode?
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        // Get label node from scene and store it for use later
        self.redBall = self.childNode(withName: "redBall2")
        if let redBall = self.redBall {
            redBall.physicsBody?.angularVelocity = -100.0
        }

    }

}
