//
//  SwipeViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 16/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit
import SnapKit

class SwipeViewController: UIViewController {

    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Swipe"
        
        label.text = "Swpie AnyWhere"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.numberOfLines = 2
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        label.isUserInteractionEnabled = true
        
        let swpieDirection = [UISwipeGestureRecognizerDirection.up,
                              UISwipeGestureRecognizerDirection.down,
                              UISwipeGestureRecognizerDirection.left,
                              UISwipeGestureRecognizerDirection.right]
        
        for item in swpieDirection {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(responseToSwipeGestue))
            swipe.direction = item
            view.addGestureRecognizer(swipe)
        }
        
    }
    
    @objc func responseToSwipeGestue(_ swipe: UISwipeGestureRecognizer) {
        switch  swipe.direction {
        case UISwipeGestureRecognizerDirection.up:
            label.text = "Up"
        case UISwipeGestureRecognizerDirection.down:
            label.text = "Down"
        case UISwipeGestureRecognizerDirection.left:
            label.text = "Left"
        case UISwipeGestureRecognizerDirection.right:
            label.text = "Right"
        default:
            label.text = ""
        }
    }

}
