//
//  ViewController.swift
//  CustomNode
//
//  Created by wuufone on 2019/7/8.
//  Copyright © 2019 江武峯. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var arScnView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arScnView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        arScnView.showsStatistics = true
        arScnView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arScnView.session.run(ARWorldTrackingConfiguration())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.viewDidDisappear(animated)
        arScnView.session.pause()
    }

    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        
        if let hitTestResult = arScnView.hitTest(sender.location(in: arScnView)).first {
            if hitTestResult.node.name == MyNode.PURPLE_BOX_NODE.rawValue {
                
                print("點到節點")
                
                return
            }
        }
        
        
        let purple = SCNMaterial()
        purple.diffuse.contents = UIColor.purple
        purple.isDoubleSided = true
        
        let videoMaterial = SCNMaterial()
        let avPlayer = AVPlayer(url: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        avPlayer.play()
        videoMaterial.diffuse.contents = avPlayer
        videoMaterial.isDoubleSided = true
        
        let box = SCNBox(width: 0.02, height: 0.02, length: 0.02, chamferRadius: 0.001)
        box.materials = [videoMaterial, purple]
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(Float.random(in: -0.1...0.1), Float.random(in: -0.1...0.1), Float.random(in: -0.1...0.1))
        boxNode.name = MyNode.PURPLE_BOX_NODE.rawValue
        
        let rootNode: SCNNode = arScnView.scene.rootNode
        rootNode.addChildNode(boxNode)
    }
    
}

enum MyNode: String {
    case PURPLE_BOX_NODE
}
