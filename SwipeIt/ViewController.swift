//
//  ViewController.swift
//  SwipeIt
//
//  Created by nithindev.narayanan on 26/02/20.
//  Copyright © 2020 nithindev.narayanan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swipeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didSwipeView(sender:)))
        swipeView.addGestureRecognizer(panGesture)
    }

    @objc func didSwipeView(sender: UIPanGestureRecognizer) {
        let panView = sender.view
        let point = sender.translation(in: view)
        panView?.center = CGPoint(x: view.center.x  + point.x, y: view.center.y + point.y)
        if sender.state == UIGestureRecognizer.State.ended {
            UIView.animate(withDuration: 0.2) {
                panView?.center = self.view.center
            }
        }
    }

}
