//
//  GameScene.swift
//  Fonts Game Selector
//
//  Created by Julian Arias Maetschl on 27-05-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {

        let text = "123456789"

        let fontList = NSFontManager.shared.availableFontFamilies

        for (index1, family) in fontList.enumerated() {
            let title = SKLabelNode(text: "\(text) : \(family.description)")
            title.fontSize = 24.0
            title.fontName = family.description
            title.fontColor = .white
            title.horizontalAlignmentMode = .left
            let forLine = (1+index1) * 28
            let yPosition = forLine % 1700
            var point = CGPoint(x: -1300, y: -900 + yPosition)
            let xOffset = Int(forLine / 1700)
            point.x += CGFloat(xOffset * 400)
            print(point)
            title.position = point
            addChild(title)
        }

    }
}
