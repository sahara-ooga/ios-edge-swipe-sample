//
//  ViewController.swift
//  slide-in-sample
//
//  Created by ogasawara_dev on 2018/08/18.
//  Copyright © 2018年 ogasawara_dev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepare(for: Edge.left)
        self.prepare(for: SwipeDirection.left)
    }
}
