//
//  UIViewController+Swipe.swift
//  slide-in-sample
//
//  Created by ogasawara_dev on 2018/08/19.
//  Copyright © 2018年 ogasawara_dev. All rights reserved.
//

import UIKit

// MARK: - スワイプ対応
extension UIViewController {
    enum SwipeDirection {
        case right
        case left
        case up
        case down
        
        var converted: UISwipeGestureRecognizer.Direction {
            switch self {
            case .right:
                return .right
            case .left:
                return .left
            case .up:
                return .up
            case .down:
                return .down
            }
        }
    }
    /// スワイプの検出を設定する
    /// UISwipeGestureRecognizerの認識する方向を１方向に制限するためのラッパー
    /// スワイプ発生時に、スワイプの方向を判別するため
    ///
    /// - Parameter directions: 検出したいスワイプの方向
    func prepare(for swipeDirections: SwipeDirection...) {
        for direction in swipeDirections {
            self.prepare(for: direction.converted)
        }
    }
    /// スワイプ認識オブジェクトの生成とUIViewへの付加
    private func prepare(for swipeDirection: UISwipeGestureRecognizer.Direction) {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self,
                                                              action: #selector(type(of: self).swipeGesture(sender:)))
        swipeGestureRecognizer.direction = swipeDirection
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    /*
     スワイプイベント発生時に呼ばれるメソッド
     */
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        fatalError("Override swipeGesture!!!")
    }
}

// MARK: - エッジスワイプイベントへの対応
extension UIViewController {
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
    @objc func edgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        fatalError("Override edgegesture")
    }
}
