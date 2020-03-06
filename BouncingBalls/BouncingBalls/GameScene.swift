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

    private var ball: SKNode?
    private var ball2: SKNode?

    private let blueBallTexture = SKTexture(imageNamed: "blueBall")
    private let redBallTexture = SKTexture(imageNamed: "redBall")
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        // Get label node from scene and store it for use later
        self.ball = self.childNode(withName: "redBall")
        self.ball2 = self.childNode(withName: "redBall2")
        if let redBall = self.ball2 {
            redBall.physicsBody?.angularVelocity = -100.0
        }

        resetBall()

        let deathAnimation = SKAction.animate(with: [blueBallTexture, redBallTexture, blueBallTexture, redBallTexture], timePerFrame: 1)
        ball?.run(deathAnimation, completion: resetBall)

    }

    func resetBall() {
        ball?.position = CGPoint(x: -160, y: 260)
        let normalTexture = SKTexture(imageNamed: "blueBall")
        ball?.run(SKAction.setTexture(normalTexture))
    }

    override func update(_ currentTime: TimeInterval) {
        // Nothing here
    }

}
