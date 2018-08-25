//
//  UIViewController+Swipe.swift
//  slide-in-sample
//
//  Created by ogasawara_dev on 2018/08/19.
//  Copyright © 2018年 ogasawara_dev. All rights reserved.
//

import UIKit

@objc protocol SwipeRecognizable {
    var view: UIView! { get }
    @objc func swipeGesture(sender: UISwipeGestureRecognizer)
}
extension SwipeRecognizable {
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
}
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
