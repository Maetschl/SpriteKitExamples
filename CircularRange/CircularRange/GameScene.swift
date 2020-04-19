//
//  GameScene.swift
//  CircularRange
//
//  Created by Julian Arias Maetschl on 19-04-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let range = SKRange(lowerLimit: 0, upperLimit: 100)

    override func didMove(to view: SKView) {

        for index in 0 ... 600 {
            let node = SKSpriteNode(color: .white, size: CGSize(width: 3, height: 3))
            let xRand = (-300 ... 300).randomElement()!
            let yRand = (-300 ... 300).randomElement()!
            node.color = .red
            if index%2 == 0 {
                node.color = .green
                makeCircularRange(to: node)
            }
            node.run(SKAction.move(to: CGPoint(x: xRand, y: yRand), duration: 5))
            addChild(node)
        }

        drawCircularRangeBy(range: range)

    }

    func makeCircularRange(to node: SKNode) {
        let constraint = SKConstraint.distance(range, to: .zero)
        node.constraints = [constraint]
    }

    func drawCircularRangeBy(range: SKRange) {
        let radius = range.upperLimit
        let node = SKShapeNode(circleOfRadius: radius)
        node.strokeColor = .white
        addChild(node)
    }

}
