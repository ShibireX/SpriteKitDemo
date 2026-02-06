//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Andreas Garcia on 26/1/26.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let ball = SKShapeNode(circleOfRadius: 40)
    
    var ballVelocity = CGVector(dx: 0, dy: 0)
        
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        ball.fillColor = .white
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        ball.physicsBody?.restitution = 0.8
        ball.physicsBody?.friction = 0
        ball.physicsBody?.linearDamping = 0
        addChild(ball)
        
        let floor = SKNode()
        floor.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width, y: 0))
        addChild(floor)
        
        let rightWall = SKNode()
        rightWall.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: size.width, y: 0), to: CGPoint(x: size.width, y: size.height))
        addChild(rightWall)
        
        let leftWall = SKNode()
        leftWall.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 0), to: CGPoint(x: 0, y: size.height))
        addChild(leftWall)
        
        let roof = SKNode()
        roof.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width, y: size.height))
        addChild(roof)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let randomX = Int.random(in: 200...300)
        let randomY = Int.random(in: 200...300)
        let impulse = CGVector(dx: ballVelocity.dx > 0 ? randomX : -randomX, dy: ballVelocity.dy > 0 ? randomY : -randomY)
        ball.physicsBody?.applyImpulse(impulse)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Runs every frame before render
        ballVelocity = ball.physicsBody?.velocity ?? CGVector(dx: 0, dy: 0)
    }
}
