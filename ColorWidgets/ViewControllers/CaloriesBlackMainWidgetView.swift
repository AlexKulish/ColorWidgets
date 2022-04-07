//
//  CaloriesBlackMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CaloriesBlackMainWidgetView: GradientView, MainWidget {
    
    let ketoDiet = KetoDiet.getDiet()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set(cornerRadius: 25)
        setupView()
        set(colors: [hexColor(hex: "222122").cgColor,
                     hexColor(hex: "222122").cgColor])
//        set(theme: .orangeGradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func set(theme: ColorTheme) {
        switch theme {
        case .orangeGradient:
            set(colors: [hexColor(hex: "FCAD80").cgColor,
                         hexColor(hex: "F8637E").cgColor])
        case .orangeFlat:
            set(colors: [hexColor(hex: "FB825B").cgColor,
                         hexColor(hex: "FB825B").cgColor])
        case .greenGradient:
            set(colors: [hexColor(hex: "92F5C7").cgColor,
                         hexColor(hex: "58C3AA").cgColor])
        case .greenFlat:
            set(colors: [hexColor(hex: "65D29A").cgColor,
                         hexColor(hex: "65D29A").cgColor])
        }
    }
    
    func update() {
        print("")
    }
    
    private func setupView() {
        
        // круглый центральный прогресс бар
        
        let mainCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 66, lineWidth: 20, progressWidth: 20)
        mainCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(mainCircularView)
        
        mainCircularView.snp.makeConstraints { make in
            // если хочешь поменять расположение по центру, меняй высоту и ширину
            make.height.equalTo(130)
            make.width.equalTo(130)
            make.top.equalTo(self.snp_topMargin).inset(21)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // калории лейбл внутри круга
        
        let caloriesLabel = UILabel()
        caloriesLabel.text = "ккал"
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textColor = .white
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_topMargin).inset(26)
            make.leading.equalTo(mainCircularView.snp_leadingMargin).inset(44)
        }
        
        // калории осталось число внутри круга
        
        let caloriesCountLabel = UILabel()
        caloriesCountLabel.text = String(format: "%.0f", ketoDiet.markCalories)
        caloriesCountLabel.font = .systemFont(ofSize: 24, weight: .bold)
        caloriesCountLabel.textAlignment = .center
        caloriesCountLabel.textColor = .white
        addSubview(caloriesCountLabel)
        
        caloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(mainCircularView.snp_leadingMargin).inset(20)
        }
        
        // калории осталось слово внутри круга
        
        let caloriesLeftLabel = UILabel()
        caloriesLeftLabel.text = "Осталось"
        caloriesLeftLabel.font = .systemFont(ofSize: 12)
        caloriesLeftLabel.textAlignment = .center
        caloriesLeftLabel.textColor = .white
        addSubview(caloriesLeftLabel)
        
        caloriesLeftLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(caloriesCountLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(mainCircularView.snp_leadingMargin).inset(30)
        }
        
        // картинка еда
        
        let eatImage = UIImage(named: "IconEat")
        let eatImageView = UIImageView(image: eatImage)
        addSubview(eatImageView)
        
        eatImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.3)
        }
        
        // съедено калорий число
        
        let eatenCaloriesCountLabel = UILabel()
        eatenCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.eatCalories)
        eatenCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        eatenCaloriesCountLabel.textAlignment = .center
        eatenCaloriesCountLabel.textColor = .white
        addSubview(eatenCaloriesCountLabel)
        
        eatenCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.3)
        }
        
        // съедено калорий слово
        
        let eatenLabel = UILabel()
        eatenLabel.text = "Съедено"
        eatenLabel.font = .systemFont(ofSize: 12)
        eatenLabel.textAlignment = .center
        eatenLabel.textColor = .white
        addSubview(eatenLabel)
        
        eatenLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatenCaloriesCountLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.3)
        }
        
        // картинка человечек
        
        let runImage = UIImage(named: "IconRun")
        let runImageView = UIImageView(image: runImage)
        addSubview(runImageView)
        
        runImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.7)
        }
        
        // сожжено калорий число
        
        let burnedCaloriesCountLabel = UILabel()
        burnedCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.burnedCalories)
        burnedCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        burnedCaloriesCountLabel.textAlignment = .center
        burnedCaloriesCountLabel.textColor = .white
        addSubview(burnedCaloriesCountLabel)
        
        burnedCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(runImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.7)
        }
        
        // сожжено калорий слово
        
        let burnedLabel = UILabel()
        burnedLabel.text = "Сожжено"
        burnedLabel.font = .systemFont(ofSize: 12)
        burnedLabel.textAlignment = .center
        burnedLabel.textColor = .white
        addSubview(burnedLabel)
        
        burnedLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(burnedCaloriesCountLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.7)
        }
        
        // круглый углеводы прогресс бар
        
        let carbsCircularView = CircularProgressView(progressColor: hexColor(hex: "FF794F"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        carbsCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(carbsCircularView)
        
        carbsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(44)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.11)
        }
        
        // углеводы лейбл
        
        let carbsLabel = UILabel()
        carbsLabel.text = "Углеводы"
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(46)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // углеводы прогресс лейбл
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) г"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textColor = .white
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // круглый белки прогресс бар
        
        let proteinCircularView = CircularProgressView(progressColor: hexColor(hex: "EDDE5A"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        proteinCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(proteinCircularView)
        
        proteinCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(44)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.73)
        }
        
        // белки лейбл
        
        let proteinsLabel = UILabel()
        proteinsLabel.text = "Белки"
        proteinsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinsLabel.textColor = .white
        addSubview(proteinsLabel)
        
        proteinsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(46)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // белки прогресс лейбл
        
        let proteinsProgressLabel = UILabel()
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) г"
        proteinsProgressLabel.font = .systemFont(ofSize: 12)
        proteinsProgressLabel.textColor = .white
        addSubview(proteinsProgressLabel)
        
        proteinsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // круглый жиры прогресс бар
        
        let fatsCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        fatsCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(fatsCircularView)
        
        fatsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(44)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.35)
        }
        
        // жиры лейбл
        
        let fatsLabel = UILabel()
        fatsLabel.text = "Жиры"
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(46)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        // жиры прогресс лейбл
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) г"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        
    }
    
    
    
}
