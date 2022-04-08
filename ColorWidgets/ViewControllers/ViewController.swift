//
//  ViewController.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    private let caloriesColorMainWidget = CaloriesColorMainWidgetView()
    private let carbsColorMainWidget = CarbsColorMainWidgetView()
    private let carbsWhiteMainWidget = CarbsWhiteMainWidgetView()
    private let caloriesWhiteMainWidget = CaloriesWhiteMainWidgetView()
    private let caloriesBlackMainWidget = CaloriesBlackMainWidgetView()
    private let carbsBlackMainWidget = CarbsBlackMainWidgetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupView()
    }
    
    

    private func setupView() {
        
        
        // КАЛОРИИ ЦВЕТНОЙ ВИДЖЕТ
        
//        view.addSubview(caloriesColorMainWidget)
//
//        caloriesColorMainWidget.snp.makeConstraints { make in
//            make.top.equalTo(view.snp_topMargin).inset(40)
//            make.centerX.equalTo(view.snp.centerX)
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(225)
//        }
        
        // КАЛОРИИ БЕЛЫЙ ВИДЖЕТ
        
//        view.addSubview(caloriesWhiteMainWidget)
//
//        caloriesWhiteMainWidget.snp.makeConstraints { make in
//            make.top.equalTo(caloriesColorMainWidget.snp_bottomMargin).offset(20)
//            make.centerX.equalTo(view.snp.centerX)
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(225)
//        }
        
        
        // УГЛЕВОДЫ ЦВЕТНОЙ ВИДЖЕТ
        
//        view.addSubview(carbsColorMainWidget)
//
//        carbsColorMainWidget.snp.makeConstraints { make in
//            make.top.equalTo(view.snp_topMargin).inset(40)
//            make.centerX.equalTo(view.snp.centerX)
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(225)
//        }
        
        // УГЛЕВОДЫ БЕЛЫЙ ВИДЖЕТ
        
//        view.addSubview(carbsWhiteMainWidget)
//
//        carbsWhiteMainWidget.snp.makeConstraints { make in
//            make.top.equalTo(carbsColorMainWidget.snp_bottomMargin).offset(20)
//            make.centerX.equalTo(view.snp.centerX)
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(225)
//        }
        
        
        // КАЛОРИИ ЧЕРНЫЙ ВИДЖЕТ
        
        view.addSubview(caloriesBlackMainWidget)

        caloriesBlackMainWidget.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).inset(40)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalToSuperview().inset(16)
            make.height.equalTo(264)
        }
        
        // УГЛЕВОДЫ ЧЕРНЫЙ ВИДЖЕТ
        
        view.addSubview(carbsBlackMainWidget)

        carbsBlackMainWidget.snp.makeConstraints { make in
            make.top.equalTo(caloriesBlackMainWidget.snp_bottomMargin).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalToSuperview().inset(16)
            make.height.equalTo(264)
        }
        
        
//        let button = UIButton()
//        button.backgroundColor = .black
//        button.setTitle("Test", for: .normal)
//
//        view.addSubview(button)
//
//        button.snp.makeConstraints { make in
//            make.top.equalTo(carbsWhiteMainWidget.snp_bottomMargin).offset(100)
//            make.centerX.equalTo(view.snp.centerX)
//            make.height.equalTo(50)
//            make.width.equalTo(200)
//        }

//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        

    }
    
//    private var count = 0

//    @objc func buttonTapped() {
//
//        carbsWhiteMainWidget.update()
//
//
////        if count == 0 {
////            carbsColorMainWidget.set(theme: .orangeGradient)
////            count += 1
////        } else if count == 1 {
////            carbsColorMainWidget.set(theme: .greenFlat)
////            count += 1
////        } else if count == 2 {
////            carbsColorMainWidget.set(theme: .orangeFlat)
////        }
//
//    }


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



