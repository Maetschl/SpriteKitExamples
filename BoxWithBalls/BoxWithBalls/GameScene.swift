//
//  GameScene.swift
//  BoxWithBalls
//
//  Created by Julian Arias Maetschl on 17-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        for _ in 0 ... 200 {
            let node = SKShapeNode(circleOfRadius: 20)
            node.strokeColor = .black
            node.physicsBody = SKPhysicsBody(circleOfRadius: 20)
            node.fillColor = Bool.random() ? .magenta : .purple
            addChild(node)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        for node in children where node.contains(pos) {
            if node.contains(pos) {
                node.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.0),
                    SKAction.scale(to: 10, duration: 0.1),
                    SKAction.removeFromParent()
                ]))
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
