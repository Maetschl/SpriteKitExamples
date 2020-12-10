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
        self.run(
            .repeatForever(
                .sequence([
                    .wait(forDuration: 0.1),
                    .customAction(withDuration: 0, actionBlock: { _, _ in
                        self.addBall()
                    }
                )]
            )
        ))
    }

    func addBall() {
        let node = getBananaNode()
//        node.strokeColor = .black
        node.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        node.physicsBody?.mass = 0.01
        node.physicsBody?.restitution = 1
        node.position.y += 600
        node.position.x += CGFloat.random(in: -200...200)
//        node.fillColor = Bool.random() ? .magenta : .purple
        addChild(node)
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

    func getBananaNode() -> SKSpriteNode {
        let number: Int = Int.random(in: 0...2)
        let texture = SKTexture(imageNamed: "banana\(number)")
        let node = SKSpriteNode(texture: texture)
        node.setScale(0.2)
        node.run(.sequence([.wait(forDuration: 5.0), .removeFromParent()]))
        return node
    }
}
