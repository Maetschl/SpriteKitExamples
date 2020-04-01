//
//  GameScene.swift
//  Compass
//
//  Created by Julian Arias Maetschl on 01-04-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var compass1: SKSpriteNode?
    var compass2: SKSpriteNode?
    var angle1: SKLabelNode?
    var angle2: SKLabelNode?

    override func didMove(to view: SKView) {
        compass1 = childNode(withName: "Compass1") as? SKSpriteNode
        compass2 = childNode(withName: "Compass2") as? SKSpriteNode
        angle1 = childNode(withName: "Angle1") as? SKLabelNode
        angle2 = childNode(withName: "Angle2") as? SKLabelNode

        let range = SKRange(lowerLimit: -.pi, upperLimit: .pi)
        let rotationConstraint = SKConstraint.zRotation(range)
        compass2?.constraints = [rotationConstraint]
    }
    
    override func update(_ currentTime: TimeInterval) {
        compass1?.zRotation = CGFloat(2 * .pi * sin(currentTime))
        angle1?.text = "zRotation: " + String(format: "%.3f", compass1!.zRotation)
        compass2?.zRotation = CGFloat(2 * .pi * sin(currentTime))
        angle2?.text = "zRotation: " + String(format: "%.3f", compass2!.zRotation)
    }
}

class SinRotationComponent: GKComponent {
    override func didAddToEntity() {
    }
    override func update(deltaTime seconds: TimeInterval) {
    }
}
