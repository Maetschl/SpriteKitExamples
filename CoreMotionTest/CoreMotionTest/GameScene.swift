//
//  GameScene.swift
//  CoreMotionTest
//
//  Created by Maetschl on 21-04-17.
//  Copyright © 2017 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    private var ballNode : SKSpriteNode?
    private let manager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        
        self.ballNode = self.childNode(withName: "ball") as? SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.01
        manager.startAccelerometerUpdates(to: OperationQueue.current!){ (data:CMAccelerometerData?, error:Error?) in
            if let accelerometerData = data {
                let acceleration = accelerometerData.acceleration
                self.ballNode?.physicsBody?.velocity.dx += 10*CGFloat(acceleration.x)
            }
        }
        
        
    }
    override func update(_ currentTime: TimeInterval) {
        //nothing here
    }
}
