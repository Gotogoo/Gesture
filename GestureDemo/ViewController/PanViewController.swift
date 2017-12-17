//
//  PanViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 16/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit

class PanViewController: UIViewController {
    
    private let label = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
    private let area = UIView(frame: CGRect(x: 0, y: 300, width: 200, height: 200))
    private var originalLabelCenter: CGPoint!
    private var beginLabelCenter: CGPoint!
    private var beginPanCenter: CGPoint!
    private var isLabelInArea: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        originalLabelCenter = view.convert(label.center, to: view)
    }
    
    private func setupUI() {
        title = "Pan"

        label.text = "Pan Me To Below View"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.numberOfLines = 2
        view.addSubview(label)
        label.center.x = view.center.x
        
        area.layer.borderWidth = 1
        area.layer.borderColor = UIColor.black.cgColor
        view.addSubview(area)
        area.center.x = view.center.x
        
        area.isUserInteractionEnabled = false
        label.isUserInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(responseToPanGesture))
        label.addGestureRecognizer(pan)
    }
    
    @objc func responseToPanGesture(_ pan: UIPanGestureRecognizer) {
        isLabelInArea = area.frame.contains(label.frame)
        
        if pan.state == UIGestureRecognizerState.began {
            beginLabelCenter = label.center
            beginPanCenter = pan.location(in: view)
        } else if pan.state == UIGestureRecognizerState.changed {
            let currentPanCenter = pan.location(in: view)
            let xOffset = currentPanCenter.x - beginPanCenter.x
            let yOffset = currentPanCenter.y - beginPanCenter.y
            let currentLabelCenter = CGPoint(x: beginLabelCenter.x + xOffset,
                                             y: beginLabelCenter.y + yOffset)
            label.center = currentLabelCenter
            label.text = "Moving"
            
            area.layer.borderColor = isLabelInArea ? UIColor.red.cgColor : UIColor.black.cgColor
           
        } else if pan.state == UIGestureRecognizerState.ended {
            area.layer.borderColor = UIColor.black.cgColor

            if isLabelInArea {
                label.text = "Cool"
            } else {
                label.center = originalLabelCenter
                label.text = "Pan Me To Below View"
            }
        }
        
    }

}
