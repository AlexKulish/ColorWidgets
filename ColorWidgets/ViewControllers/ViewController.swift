//
//  ViewController.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

protocol MainWidget: UIView {
    func set(theme: ColorTheme)
    func update()
}

enum ColorTheme {
    case orangeGradient
    case orangeFlat
    case greenGradient
    case greenFlat
}



