//
//  GameViewController.swift
//  StateMachineAnimation
//
//  Created by Julian Arias Maetschl on 18-04-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }
    }

}
