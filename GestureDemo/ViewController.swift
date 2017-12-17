//
//  ViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 15/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var tableView = UITableView()
    private let gestureVcs = [TapViewController(),
                              SwipeViewController(),
                              PanViewController(),
                              PinchViewController(),
                              RotationViewController(),
                              LongPressViewController()]
    private var gestures = ["Tap", "Swipe", "Pan", "Pinch", "Rotation", "Long Press"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gestures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = gestures[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = gestureVcs[indexPath.row]
        vc.view.backgroundColor = UIColor.white
        show(vc, sender: nil)
    }
}

