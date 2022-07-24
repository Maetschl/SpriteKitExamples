//
//  GameScene.swift
//  Bubbles
//
//  Created by Julian Arias Maetschl on 09-06-21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let ballCategory: UInt32 = 0xb0001
    let edgeCategory: UInt32 = 0xb0010
    var nodeCount = 0

    override func sceneDidLoad() {
        //set physicsWorld properties
//        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)

        //set edges as PhysicsBody
        let edge = SKPhysicsBody(edgeLoopFrom: self.frame)
        edge.friction = 0
        edge.restitution = 1.0
        edge.categoryBitMask = edgeCategory
        self.physicsBody = edge

        for _ in 1...10 {
            makebubble()
        }
    }

    func makebubble() {

        let bubbleTexture = SKTexture(imageNamed: "bubble")
        let bubble = SKSpriteNode(texture: bubbleTexture)
        let bphysicsBody = SKPhysicsBody(circleOfRadius: bubbleTexture.size().height/2)

        bphysicsBody.isDynamic = true
        bphysicsBody.usesPreciseCollisionDetection = true
        bphysicsBody.restitution = 1.0
        bphysicsBody.friction = 0
        bphysicsBody.angularDamping = 0
        bphysicsBody.linearDamping = 0
        bphysicsBody.categoryBitMask = ballCategory
        bphysicsBody.collisionBitMask = ballCategory | edgeCategory
        bphysicsBody.contactTestBitMask = ballCategory | edgeCategory
        bubble.physicsBody = bphysicsBody
        bubble.name = "bubble"

        // Get a random possition within the width of the scene
        let x = CGFloat(randomize(number: Int(size.width - 40)))
        let y = CGFloat(randomize(number: Int(size.height - 40)))

        // position the bubble
        bubble.position.x = x
        bubble.position.y = y

        // Add the bubble
        addMyChild(node: bubble)
    }

    func addMyChild(node:SKSpriteNode){
        self.addChild(node)
        node.physicsBody!.applyImpulse(CGVector(dx: 100.0, dy: -20.0))
        nodeCount += 1
    }

    // function that returns a random int from 0 to n-1
    func randomize(number: Int) -> Int{
        return Int(arc4random()) % number
    }
}
