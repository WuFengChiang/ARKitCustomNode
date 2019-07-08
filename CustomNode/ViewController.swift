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
        
        let rootNode: SCNNode = arScnView.scene.rootNode
        
        for childNode in rootNode.childNodes {
            if childNode.name == MyNode.PURPLE_BOX_NODE.rawValue {
                print("只會建造出一個紫色方塊")
                return
            }
        }
        
        let purple = SCNMaterial()
        purple.diffuse.contents = UIColor.purple
        purple.isDoubleSided = true
        
        let box = SCNBox(width: 0.02, height: 0.02, length: 0.02, chamferRadius: 0.005)
        box.materials = [purple]
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0.01, 0, -0.1)
        boxNode.name = MyNode.PURPLE_BOX_NODE.rawValue
        
        
        rootNode.addChildNode(boxNode)
    }
    
}

enum MyNode: String {
    case PURPLE_BOX_NODE
}
