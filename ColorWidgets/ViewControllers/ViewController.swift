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
        
        let widgets = [caloriesColorMainWidget, caloriesWhiteMainWidget, carbsColorMainWidget, carbsWhiteMainWidget, caloriesBlackMainWidget, carbsBlackMainWidget]
        
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width) * widgets.count, height: 264)
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        for (index, widget) in widgets.enumerated() {
            scrollView.addSubview(widget)
            widget.snp.makeConstraints { make in
                make.centerY.equalTo(view.snp.centerY)
                make.width.equalToSuperview()
                make.height.equalTo(264)
                make.leading.equalToSuperview().inset(view.frame.size.width * CGFloat(index))
            }
            
        }
        
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
////            make.center.equalToSuperview()
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(225)
//        }
        
        
        // КАЛОРИИ ЧЕРНЫЙ ВИДЖЕТ
        
//        view.addSubview(caloriesBlackMainWidget)
//
//        caloriesBlackMainWidget.snp.makeConstraints { make in
//            make.top.equalTo(view.snp_topMargin).inset(40)
//            make.centerX.equalTo(view.snp.centerX)
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(264)
//        }
        
        // УГЛЕВОДЫ ЧЕРНЫЙ ВИДЖЕТ
        
//        view.addSubview(carbsBlackMainWidget)
//
//        carbsBlackMainWidget.snp.makeConstraints { make in
//            make.top.equalTo(caloriesBlackMainWidget.snp_bottomMargin).offset(20)
//            make.centerX.equalTo(view.snp.centerX)
//            make.width.equalToSuperview().inset(16)
//            make.height.equalTo(264)
//        }
        
        
        let testValuesButton = UIButton()
        testValuesButton.backgroundColor = .black
        testValuesButton.setTitle("Test values", for: .normal)

        view.addSubview(testValuesButton)

        testValuesButton.snp.makeConstraints { make in
            make.top.equalTo(carbsWhiteMainWidget.snp_bottomMargin).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        let testColorButton = UIButton()
        testColorButton.backgroundColor = .black
        testColorButton.setTitle("Test colors", for: .normal)

        view.addSubview(testColorButton)

        testColorButton.snp.makeConstraints { make in
            make.top.equalTo(testValuesButton.snp_bottomMargin).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }

        testValuesButton.addTarget(self, action: #selector(testValueButtonTapped), for: .touchUpInside)
        
        testColorButton.addTarget(self, action: #selector(testColorButtonTapped), for: .touchUpInside)


    }

    @objc func testValueButtonTapped() {
        
        for _ in 0...10 {
            
            caloriesColorMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            caloriesColorMainWidget.update()
            
            caloriesWhiteMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            caloriesWhiteMainWidget.update()
            
            carbsColorMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            carbsColorMainWidget.update()
            
            carbsWhiteMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            carbsWhiteMainWidget.update()
            
            caloriesBlackMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            caloriesBlackMainWidget.update()
            
            carbsBlackMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            carbsBlackMainWidget.update()
            
        }
    }
    
    private var count = 0
    
    @objc func testColorButtonTapped() {
            
        if count == 0 {
            caloriesColorMainWidget.set(theme: .greenGradient)
            carbsColorMainWidget.set(theme: .greenGradient)
            count += 1
        } else if count == 1 {
            caloriesColorMainWidget.set(theme: .greenFlat)
            carbsColorMainWidget.set(theme: .greenFlat)
            count += 1
        } else if count == 2 {
            caloriesColorMainWidget.set(theme: .orangeFlat)
            carbsColorMainWidget.set(theme: .orangeFlat)
            count += 1
        } else if count == 3 {
            caloriesColorMainWidget.set(theme: .orangeGradient)
            carbsColorMainWidget.set(theme: .orangeGradient)
            count += 1
        } else if count == 4 {
            caloriesColorMainWidget.set(theme: .greenGradient)
            carbsColorMainWidget.set(theme: .greenGradient)
            count += 1
        } else if count == 5 {
            caloriesColorMainWidget.set(theme: .greenFlat)
            carbsColorMainWidget.set(theme: .greenFlat)
            count += 1
        } else if count == 6 {
            caloriesColorMainWidget.set(theme: .orangeFlat)
            carbsColorMainWidget.set(theme: .orangeFlat)
            count += 1
        } else if count == 7 {
            caloriesColorMainWidget.set(theme: .orangeGradient)
            carbsColorMainWidget.set(theme: .orangeGradient)
            count += 1
        } else if count == 8 {
            caloriesColorMainWidget.set(theme: .greenGradient)
            carbsColorMainWidget.set(theme: .greenGradient)
            count += 1
        } else if count == 9 {
            caloriesColorMainWidget.set(theme: .greenFlat)
            carbsColorMainWidget.set(theme: .greenFlat)
            count += 1
        } else if count == 10{
            caloriesColorMainWidget.set(theme: .orangeFlat)
            carbsColorMainWidget.set(theme: .orangeFlat)
            count += 1
        } else {
            caloriesColorMainWidget.set(theme: .orangeGradient)
            carbsColorMainWidget.set(theme: .orangeGradient)
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



