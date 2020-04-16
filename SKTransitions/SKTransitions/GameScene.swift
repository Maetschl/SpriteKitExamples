//
//  GameScene.swift
//  SKTransitions
//
//  Created by Julian Arias Maetschl on 15-04-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let colors: [SKColor] = [.red, .blue, .magenta, .green, .white, .gray, .orange]
    var randomColor: SKColor {
        return colors.randomElement()!
    }

    var skView: SKView!

    static var timeInterval: TimeInterval = 1

    let transitions: [SKTransition] = [
        .crossFade(withDuration: timeInterval),
        .doorsCloseHorizontal(withDuration: timeInterval),
        .doorsCloseVertical(withDuration: timeInterval),
        .doorsOpenHorizontal(withDuration: timeInterval),
        .doorsOpenVertical(withDuration: timeInterval),
        .doorway(withDuration: timeInterval),
        .fade(with: .black, duration: timeInterval),
        .fade(withDuration: timeInterval),
        .flipHorizontal(withDuration: timeInterval)
    ]

    override func didMove(to view: SKView) {
        self.backgroundColor = randomColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = GameScene()
        scene.skView = self.skView
        skView.presentScene(scene, transition: transitions.randomElement()!)
    }

}
