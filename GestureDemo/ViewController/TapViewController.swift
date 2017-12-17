//
//  TapViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 16/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit
import SnapKit

class TapViewController: UIViewController {
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Tap"
        label.text = "Tap Change To Red, Double Tap To Green"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.backgroundColor = UIColor.orange
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        label.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(responseToTapGesture))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(responseToTapGesture))
        doubleTap.numberOfTapsRequired = 2
        label.addGestureRecognizer(doubleTap)
        
        tap.require(toFail: doubleTap)
    }
    
    @objc func responseToTapGesture(_ tap: UITapGestureRecognizer) {
        if tap.numberOfTapsRequired == 1 {
            label.backgroundColor = UIColor.red
        } else if tap.numberOfTapsRequired == 2 {
            label.backgroundColor = UIColor.green
        }
    }

}
