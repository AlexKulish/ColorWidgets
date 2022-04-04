//
//  ViewController.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let caloriesColorMainWidget = CaloriesColorMainWidgetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(caloriesColorMainWidget)
        
        caloriesColorMainWidget.caloriesColorMainWidgetView.snp.makeConstraints { make in
            make.top.equalTo(view).inset(140)
            make.left.equalTo(view).inset(16)
            make.right.equalTo(view).inset(16)
            make.height.equalTo(225)
        }
        
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



