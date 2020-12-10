//
//  GameScene.swift
//  MasksTest
//
//  Created by Julian Arias Maetschl on 06-06-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()

    private var lastUpdateTime : TimeInterval = 0

    struct PhysicsCategory {
        static let none: UInt32 = 0
        static let all : UInt32 = UInt32.max
        static let star: UInt32 = 0x1       // 1
        static let edge: UInt32 = 0x10      // 2
    }

    private var edge: SKPhysicsBody!

    override func sceneDidLoad() {

        self.lastUpdateTime = 0

        edge = SKPhysicsBody(edgeLoopFrom: self.frame)
        edge.categoryBitMask = PhysicsCategory.edge
        edge.contactTestBitMask = PhysicsCategory.star
        edge.collisionBitMask = PhysicsCategory.star
        
    }


    override func didMove(to view: SKView) {

        physicsWorld.contactDelegate = self

        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addStar),
                SKAction.wait(forDuration: 1.0)
            ])
        ))
    }

    func didBegin(_ contact: SKPhysicsContact) {

        print("didBegin called")
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }

        if((firstBody.categoryBitMask & PhysicsCategory.star != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.edge != 0)){

            print("call destroyStar")
            if let star = firstBody.node as? SKSpriteNode {
                destroyStar(star: star)
            }
        }
    }

    func addStar(){

        let star = SKSpriteNode(imageNamed: "star")

        let scale = CGFloat.random(in: 0.1 ... 0.5)
        star.xScale = scale
        star.yScale = scale
        star.zPosition = 1.0

        star.physicsBody = SKPhysicsBody(rectangleOf: star.size)
        star.physicsBody?.linearDamping = 1.0
        star.physicsBody?.friction = 1.0

        star.physicsBody?.isDynamic = true // 2
        star.physicsBody?.categoryBitMask = PhysicsCategory.star // 3
        star.physicsBody?.contactTestBitMask = PhysicsCategory.edge // 4
        star.physicsBody?.collisionBitMask = PhysicsCategory.edge

        let actualX = CGFloat.random(in: (-1*size.width/2)+50 ... (size.width/2)-50)

        star.position = CGPoint(x: actualX, y: self.size.height)
        addChild(star)
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }

        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime

        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }

        self.lastUpdateTime = currentTime
    }

    func destroyStar(star: SKSpriteNode){

        print("star destroyed")
        star.removeFromParent()

    }
}
