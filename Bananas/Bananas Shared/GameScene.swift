//
//  GameScene.swift
//  Bananas Shared
//
//  Created by Julian Arias Maetschl on 18-09-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    class func newGameScene() -> GameScene {
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        scene.scaleMode = .aspectFill
        return scene
    }

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

        childNode(withName: "paddle")?.run(.repeatForever(.rotate(byAngle: -0.5, duration: 0.1)))
    }

    func addBall() {
        let node = getBananaNode()
        node.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        node.physicsBody?.mass = 0.01
        node.physicsBody?.restitution = 1
        node.position.y += 600
        node.position.x += CGFloat.random(in: -1300...1300)
        addChild(node)
    }

    func touchDown(atPoint pos : CGPoint) {
        for node in children where node.contains(pos) {
            if node.contains(pos) {
//                node.run(SKAction.sequence([
//                    SKAction.fadeOut(withDuration: 0.0),
//                    SKAction.scale(to: 10, duration: 0.1),
//                    SKAction.removeFromParent()
//                ]))
                node.run(SKAction.sequence([
                    SKAction(named: "Explosion")!,
                    SKAction.removeFromParent()
                ]))
            }
        }
    }

    func getBananaNode() -> SKSpriteNode {
        let number: Int = Int.random(in: 0...2)
        let texture = SKTexture(imageNamed: "banana\(number)")
        let node = SKSpriteNode(texture: texture)
        node.setScale(0.2)
        node.color = .red
        node.blendMode = .alpha
        node.name = "banana"
        return node
    }
    
    override func update(_ currentTime: TimeInterval) {
//         Called before each frame is rendered
        if children.count > 600 {
            children.filter({
                $0.name == "banana"
            }).forEach {
                $0.run(.removeFromParent())
            }
        }
    }
}
