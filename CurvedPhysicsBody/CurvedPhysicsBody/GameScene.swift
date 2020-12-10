//
//  GameScene.swift
//  CurvedPhysicsBody
//
//  Created by Julian Arias Maetschl on 10-12-20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var node : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.node = self.childNode(withName: "//helloLabel") as? SKLabelNode
        let path = CGMutablePath()
        path.addLine(to: CGPoint(x: 10, y: 10))
        path.addArc(center: CGPoint(x: 20, y: 20), radius: 50, startAngle: 20, endAngle: 60, clockwise: true)
        node?.physicsBody = SKPhysicsBody(edgeLoopFrom: path)
    }
    
}
