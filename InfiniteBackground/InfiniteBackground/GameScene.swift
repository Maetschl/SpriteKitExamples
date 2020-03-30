//
//  GameScene.swift
//  InfiniteBackground
//
//  Created by Julian Arias Maetschl on 30-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var image1: SKSpriteNode!
    var image2: SKSpriteNode!

    var colors: [SKColor] = [.red, .yellow, .green, .brown]
    var currentColorIndex = -1
    
    override func didMove(to view: SKView) {
        let rect = CGRect(x: -300, y: -200, width: 600, height: 400)
        let screenSimulator = SKShapeNode(rect: rect)
        screenSimulator.strokeColor = .lightGray
        screenSimulator.lineWidth = 6
        screenSimulator.zPosition = 100
        addChild(screenSimulator)

        image1 = SKSpriteNode(color: colors[0], size: CGSize(width: 600, height: 400))
        image1.color = nodeFromNextColor()
        image2 = SKSpriteNode(color: colors[1], size: CGSize(width: 600, height: 400))
        image2.color = nodeFromNextColor()
        let xPosition = image1.position.x + image1.size.width
        image2.position = CGPoint(x: xPosition, y: 0)

        addChild(image1)
        addChild(image2)
    }

    func nodeFromNextColor() -> SKColor {
        currentColorIndex += 1
        if currentColorIndex >= colors.count {
            currentColorIndex = 0
        }
        return colors[currentColorIndex]
    }

    override func update(_ currentTime: TimeInterval) {
        let delta: CGFloat = 10.0
        image1.position.x -= delta
        image2.position.x -= delta
        print(image1.position.x + image1.size.width)
        if image1.position.x + image1.size.width <= 0 {
            image1.color = nodeFromNextColor()
            image1.position.x = image2.position.x + image2.size.width
        }
        if image2.position.x + image2.size.width < 0 {
            image2.color = nodeFromNextColor()
            image2.position.x = image1.position.x + image1.size.width
        }
    }
    
    
}
