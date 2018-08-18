//
//  ViewController.swift
//  slide-in-sample
//
//  Created by ogasawara_dev on 2018/08/18.
//  Copyright © 2018年 ogasawara_dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareForSwipe()
        self.prepareForEdgeSwipe()
    }
}

// MARK: - スワイプ対応
extension UIViewController {
    /// スワイプ認識オブジェクトの生成とUIViewへの付加
    func prepareForSwipe(direction: UISwipeGestureRecognizer.Direction = .right) {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self,
                                                              action: #selector(type(of: self).swipeGesture(sender:)))
        swipeGestureRecognizer.direction = direction
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    /*
     スワイプイベント発生時に呼ばれるメソッド
     */
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        print("direction: \(sender.direction)")
    }
}

// MARK: - エッジスワイプイベントへの対応
extension UIViewController {
    /// エッジスワイプイベントの検出の開始
    ///
    /// - Parameter edges: 検出を始めたい端（複数指定可） デフォルトでは左端
    func prepareForEdgeSwipe(edges: UIRectEdge = .left) {
        // TODO: 上端・下端はそれぞれOSのエッジスワイプと競合するため、対応が必要
        let swipeEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(type(of: self).edgeGesture(sender:)))
        swipeEdgeRecognizer.edges = edges
        self.view.addGestureRecognizer(swipeEdgeRecognizer)
    }
    @objc func edgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        print("edeges:\(sender.edges)")
    }
}
