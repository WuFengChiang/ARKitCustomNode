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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arScnView.session.run(ARWorldTrackingConfiguration())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.viewDidDisappear(animated)
        arScnView.session.pause()
    }


}

