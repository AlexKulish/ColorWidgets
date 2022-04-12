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
        
        
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Test", for: .normal)

        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.top.equalTo(carbsWhiteMainWidget.snp_bottomMargin).offset(100)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)


    }
    
    private var count = 0

    @objc func buttonTapped() {


        if count == 0 {
            
            caloriesColorMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            caloriesColorMainWidget.update()
            

            caloriesColorMainWidget.set(theme: .greenGradient)
            carbsColorMainWidget.set(theme: .greenGradient)
            
            count += 1
        } else if count == 1 {
            
            caloriesWhiteMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            caloriesWhiteMainWidget.update()
            
            
            
            caloriesColorMainWidget.set(theme: .greenFlat)
            carbsColorMainWidget.set(theme: .greenFlat)
            
            count += 1
        } else if count == 2 {
            
            carbsColorMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            carbsColorMainWidget.update()
        
            caloriesColorMainWidget.set(theme: .orangeFlat)
            carbsColorMainWidget.set(theme: .orangeFlat)
            
            count += 1
            
        } else if count == 3 {
            
            carbsWhiteMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            carbsWhiteMainWidget.update()
            
            count += 1
            
        } else if count == 4 {
            
            caloriesBlackMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            
            caloriesBlackMainWidget.update()

            
            count += 1
            
        } else if count == 5 {
            
            carbsBlackMainWidget.ketoDiet = KetoDiet.getRandomDiet()
            carbsBlackMainWidget.update()
            
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



