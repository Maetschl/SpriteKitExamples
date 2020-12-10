//
//  GameViewController.swift
//  Bananas macOS
//
//  Created by Julian Arias Maetschl on 18-09-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class GameViewController: NSViewController {

    let transparentMode = true

    override func viewWillAppear() {
        if transparentMode {
            view.window?.isOpaque = false
            view.window?.hasShadow = false
            view.window?.backgroundColor = NSColor.clear
            view.window?.titlebarAppearsTransparent = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene.newGameScene()
        let skView = self.view as! SKView

        if transparentMode {
            scene.backgroundColor = .clear
            self.view.layer?.backgroundColor = .clear
            skView.allowsTransparency = true
        }

        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = false
    }

}

extension GameScene {

    override func mouseDown(with event: NSEvent) {}

    override func mouseDragged(with event: NSEvent) {}

    override func mouseUp(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }

}
