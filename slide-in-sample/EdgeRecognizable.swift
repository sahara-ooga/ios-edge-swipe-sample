//
//  EdgeRecognizable.swift
//  slide-in-sample
//
//  Created by ogasawara_dev on 2018/08/25.
//  Copyright © 2018年 ogasawara_dev. All rights reserved.
//

import UIKit
@objc protocol EdgeRecognizable {
    var view: UIView! { get }
    func edgeGesture(sender: UIScreenEdgePanGestureRecognizer)
}
extension EdgeRecognizable {
    /// エッジスワイプの検出を設定する
    /// UIScreenEdgePanGestureRecognizerの認識するエッジを一つに制限するためのラッパー
    ///
    /// - Parameter edges: スワイプを認識したいエッジ
    func prepare(for edges: Edge...) {
        for edge in edges {
            self.prepare(for: edge.converted)
        }
    }
    /// エッジスワイプイベントの検出の開始
    ///
    /// - Parameter edges: 検出を始めたい端（複数指定可)
    private func prepare(for edges: UIRectEdge) {
        // TODO: 上端・下端はそれぞれOSのエッジスワイプと競合するため、対応が必要
        let swipeEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                                   action: #selector(type(of: self).edgeGesture(sender:)))
        swipeEdgeRecognizer.edges = edges
        self.view.addGestureRecognizer(swipeEdgeRecognizer)
    }
}
enum Edge {
    case top
    case left
    case bottom
    case right
    
    var converted: UIRectEdge {
        switch self {
        case .top:
            return .top
        case .left:
            return .left
        case .bottom:
            return .bottom
        case .right:
            return .right
        }
    }
}
