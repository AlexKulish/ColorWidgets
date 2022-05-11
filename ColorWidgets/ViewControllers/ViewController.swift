//
//  ViewController.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

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

class ViewController: UIViewController {
    
    
    private let caloriesColorMainWidget = CaloriesColorMainWidgetView()
    private let carbsColorMainWidget = CarbsColorMainWidgetView()
    private let carbsWhiteMainWidget = CarbsWhiteMainWidgetView()
    private let caloriesWhiteMainWidget = CaloriesWhiteMainWidgetView()
    private let caloriesBlackMainWidget = CaloriesBlackMainWidgetView()
    private let carbsBlackMainWidget = CarbsBlackMainWidgetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupView()
    }
    
    

    private func setupView() {
        
        let widgets = [caloriesColorMainWidget, caloriesWhiteMainWidget, carbsColorMainWidget, carbsWhiteMainWidget, caloriesBlackMainWidget, carbsBlackMainWidget]
        
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width) * widgets.count, height: 264)
        scrollView.isPagingEnabled = true
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        for (index, widget) in widgets.enumerated() {
            scrollView.addSubview(widget)
            widget.snp.makeConstraints { make in
                
                if index == 0 {
                    make.centerY.equalTo(view.snp.centerY)
                    make.width.equalToSuperview().inset(16)
                    make.height.equalTo(225)
                    make.leading.equalTo(scrollView.contentLayoutGuide.snp.leading).offset(16)
                } else if index == 1 || index == 2 || index == 3 {
                    make.centerY.equalTo(view.snp.centerY)
                    make.width.equalToSuperview().inset(16)
                    make.height.equalTo(225)
                    make.leading.equalTo(widgets[index - 1].snp.trailing).offset(32)
                } else {
                    make.centerY.equalTo(view.snp.centerY)
                    make.width.equalToSuperview()
                    make.height.equalTo(264)
                    make.leading.equalToSuperview().inset(view.frame.size.width * CGFloat(index))
                }
                
            }
            
        }
        
        let testValuesButton = UIButton()
        testValuesButton.backgroundColor = .black
        testValuesButton.layer.cornerRadius = 20
        testValuesButton.setTitle("Test values", for: .normal)

        view.addSubview(testValuesButton)

        testValuesButton.snp.makeConstraints { make in
            make.top.equalTo(caloriesColorMainWidget.snp_bottomMargin).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        let testOrangeGradientButton = UIButton()
        testOrangeGradientButton.backgroundColor = caloriesColorMainWidget.hexColor(hex: "FCAD80")
        testOrangeGradientButton.layer.cornerRadius = 20
        
        view.addSubview(testOrangeGradientButton)
        
        testOrangeGradientButton.snp.makeConstraints { make in
            make.top.equalTo(testValuesButton.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.leading.equalTo(view.snp_leadingMargin).inset(50)
        }
        
        let testGreenGradientButton = UIButton()
        testGreenGradientButton.backgroundColor = caloriesColorMainWidget.hexColor(hex: "92F5C7")
        testGreenGradientButton.layer.cornerRadius = 20
        
        view.addSubview(testGreenGradientButton)
        
        testGreenGradientButton.snp.makeConstraints { make in
            make.top.equalTo(testValuesButton.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.leading.equalTo(testOrangeGradientButton.snp_trailingMargin).offset(25)
        }
        
        let testOrangeFlatGradientButton = UIButton()
        testOrangeFlatGradientButton.backgroundColor = caloriesColorMainWidget.hexColor(hex: "FB825B")
        testOrangeFlatGradientButton.layer.cornerRadius = 20
        
        view.addSubview(testOrangeFlatGradientButton)
        
        testOrangeFlatGradientButton.snp.makeConstraints { make in
            make.top.equalTo(testValuesButton.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.leading.equalTo(testGreenGradientButton.snp_trailingMargin).offset(25)
        }
        
        let testGreenFlatGradientButton = UIButton()
        testGreenFlatGradientButton.backgroundColor = caloriesColorMainWidget.hexColor(hex: "65D29A")
        testGreenFlatGradientButton.layer.cornerRadius = 20
        
        view.addSubview(testGreenFlatGradientButton)
        
        testGreenFlatGradientButton.snp.makeConstraints { make in
            make.top.equalTo(testValuesButton.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.leading.equalTo(testOrangeFlatGradientButton.snp_trailingMargin).offset(25)
        }
        
        

        testValuesButton.addTarget(self, action: #selector(testValueButtonTapped), for: .touchUpInside)
        testOrangeGradientButton.addTarget(self, action: #selector(testOrangeGradientButtonTapped), for: .touchUpInside)
        testGreenGradientButton.addTarget(self, action: #selector(testGreenGradientButtonTapped), for: .touchUpInside)
        testOrangeFlatGradientButton.addTarget(self, action: #selector(testOrangeFlatButtonTapped), for: .touchUpInside)
        testGreenFlatGradientButton.addTarget(self, action: #selector(testGreenFlatButtonTapped), for: .touchUpInside)
        
        

    }

    @objc func testValueButtonTapped() {
        
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
    
    @objc func testOrangeGradientButtonTapped() {
        caloriesColorMainWidget.set(theme: .orangeGradient)
        carbsColorMainWidget.set(theme: .orangeGradient)
        carbsWhiteMainWidget.set(theme: .orangeGradient)
        caloriesWhiteMainWidget.set(theme: .orangeGradient)
    }
    
    @objc func testGreenGradientButtonTapped() {
        caloriesColorMainWidget.set(theme: .greenGradient)
        carbsColorMainWidget.set(theme: .greenGradient)
        carbsWhiteMainWidget.set(theme: .greenGradient)
        caloriesWhiteMainWidget.set(theme: .greenGradient)
    }
    
    @objc func testOrangeFlatButtonTapped() {
        caloriesColorMainWidget.set(theme: .orangeFlat)
        carbsColorMainWidget.set(theme: .orangeFlat)
        carbsWhiteMainWidget.set(theme: .orangeFlat)
        caloriesWhiteMainWidget.set(theme: .orangeFlat)
    }
    
    @objc func testGreenFlatButtonTapped() {
        caloriesColorMainWidget.set(theme: .greenFlat)
        carbsColorMainWidget.set(theme: .greenFlat)
        carbsWhiteMainWidget.set(theme: .greenFlat)
        caloriesWhiteMainWidget.set(theme: .greenFlat)
    }

}
