//
//  GameScene.swift
//  TestJoint
//
//  Created by Maetschl on 22-07-17.
//  Copyright © 2017 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let nodeSize = CGSize(width: 10, height: 10)
        let node = SKSpriteNode(color: .red, size: nodeSize)
        node.physicsBody = SKPhysicsBody(rectangleOf: nodeSize)
        node.physicsBody?.isDynamic = false
        self.addChild(node)
        
        let node2Size = CGSize(width: 60, height: 8)
        let node2 = SKSpriteNode(color: .green, size: node2Size)
        node2.position = CGPoint(x: 20, y: 0)
        //node2.anchorPoint = CGPoint(x: 0.0, y: 0.5) // <- New Line
        node2.physicsBody = SKPhysicsBody(rectangleOf: node2Size)
        node2.physicsBody?.mass = 0.1
        self.addChild(node2)
        
        // Scale Line
//        node2.run(SKAction.repeatForever(SKAction.sequence([
//            SKAction.scale(to: 0.2, duration: 1.0),
//            SKAction.scale(to: 1.5, duration: 0.5),
//            ])))
        
        
        let a = SKPhysicsJointPin.joint(withBodyA: node.physicsBody! , bodyB: node2.physicsBody!, anchor: CGPoint(x: 0.0, y: 0.0))
        self.physicsWorld.add(a)
        
    }
    
}
