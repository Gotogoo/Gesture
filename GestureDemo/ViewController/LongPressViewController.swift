//
//  LongPressViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 16/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit

class LongPressViewController: UIViewController {
    private let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Long Press"
        
        imageView.image = UIImage(cgImage: #imageLiteral(resourceName: "cat") .cgImage!)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        imageView.center = view.center
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(responseToLongPressGesture))
        longPress.minimumPressDuration = 1
        imageView.isUserInteractionEnabled = true
        view.addGestureRecognizer(longPress)
    }
    
    @objc func responseToLongPressGesture(_ longPress: UILongPressGestureRecognizer) {
        if longPress.state == UIGestureRecognizerState.began {
            UIView.animate(withDuration: 0.3, animations: { [unowned self] in
                self.imageView.transform = self.imageView.transform.scaledBy(x: 2, y: 2)
            })
        } else if longPress.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.3, animations: { [unowned self] in
                self.imageView.transform = self.imageView.transform.scaledBy(x: 0.5, y: 0.5)
            })
        }
    }

}
