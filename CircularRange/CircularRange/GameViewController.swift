//
//  GameViewController.swift
//  CircularRange
//
//  Created by Julian Arias Maetschl on 19-04-20.
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
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
    }

    let newScene = loadScene(named: "some", classType: GameScene.self)
    // newScene is GameScene type.
}

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

func loadScene<T>(named name: String, classType: T.Type) -> T? {
    return SKScene(fileNamed: name) as? T
}
}
