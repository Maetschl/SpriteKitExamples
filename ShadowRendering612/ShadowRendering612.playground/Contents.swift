import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        let mask: UInt32 = 1
        let background = SKSpriteNode(color: UIColor.blue, size: frame.size)
        background.zPosition = 0
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.lightingBitMask = mask
        addChild(background)


        let sprite = SKSpriteNode(imageNamed: "600.png")
        sprite.name = "asd"
        sprite.zPosition = 3
        sprite.position = CGPoint(x: frame.midX, y: frame.midY + 100)
//        sprite.size = CGSize(width: 200, height: 200)
//        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: CGSize(width: 50, height: 50))
//        sprite.physicsBody?.categoryBitMask = 2
        sprite.shadowCastBitMask = mask
//        sprite.lightingBitMask = 1
        sprite.physicsBody?.isDynamic = false
        addChild(sprite)

        let light = SKLightNode()
        light.zPosition = 3
        light.categoryBitMask = mask
        light.falloff = 0.5
        light.lightColor = UIColor.white
        light.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        addChild(light)
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))

let scene = GameScene()
scene.scaleMode = .aspectFill
scene.size = sceneView.frame.size
sceneView.presentScene(scene)
sceneView.showsPhysics = true
sceneView.ignoresSiblingOrder = true

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
