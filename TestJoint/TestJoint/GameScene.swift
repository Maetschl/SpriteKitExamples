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
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        let nodeSize = CGSize(width: 10, height: 10)
        let node = SKSpriteNode(color: .red, size: nodeSize)
        node.physicsBody = SKPhysicsBody(rectangleOf: nodeSize)
        node.physicsBody?.isDynamic = false
        self.addChild(node)
        
        let node2Size = CGSize(width: 60, height: 8)
        let node2 = SKSpriteNode(color: .green, size: node2Size)
        node2.position = CGPoint(x: 30, y: 0)
        node2.physicsBody = SKPhysicsBody(rectangleOf: node2Size)
        node2.physicsBody?.mass = 1.0
        self.addChild(node2)
        
        
        let a = SKPhysicsJointPin.joint(withBodyA: node.physicsBody! , bodyB: node2.physicsBody!, anchor: CGPoint(x: 0.0, y: 0.0))
        self.physicsWorld.add(a)
        
    }
    
}
