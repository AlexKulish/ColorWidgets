//
//  CaloriesBlackMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CaloriesBlackMainWidgetView: GradientView, MainWidget {
    
    var ketoDiet = KetoDiet.getDiet()
    
    private var mainCircularView: CircularProgressView!
    private var carbsCircularView: CircularProgressView!
    private var proteinCircularView: CircularProgressView!
    private var fatsCircularView: CircularProgressView!
    
    private let caloriesCountLabel = UILabel()
    private let eatenCaloriesCountLabel = UILabel()
    private let burnedCaloriesCountLabel = UILabel()
    
    private let carbsProgressLabel = UILabel()
    private let proteinsProgressLabel = UILabel()
    private let fatsProgressLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mainCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 65, lineWidth: 20, progressWidth: 20)
        self.carbsCircularView = CircularProgressView(progressColor: hexColor(hex: "FF794F"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        self.proteinCircularView = CircularProgressView(progressColor: hexColor(hex: "EDDE5A"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        self.fatsCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        set(cornerRadius: 25)
        setupView()
        set(colors: [hexColor(hex: "222122").cgColor,
                     hexColor(hex: "222122").cgColor])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func set(theme: ColorTheme) {
        switch theme {
        case .orangeGradient:
            set(colors: [hexColor(hex: "222122").cgColor,
                         hexColor(hex: "222122").cgColor])
        case .orangeFlat:
            set(colors: [hexColor(hex: "222122").cgColor,
                         hexColor(hex: "222122").cgColor])
        case .greenGradient:
            set(colors: [hexColor(hex: "222122").cgColor,
                         hexColor(hex: "222122").cgColor])
        case .greenFlat:
            set(colors: [hexColor(hex: "222122").cgColor,
                         hexColor(hex: "222122").cgColor])
        }
    }
    
    func update() {
        
        mainCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCalories, valueTwo: ketoDiet.markCalories))
        
        carbsCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs))
        
        proteinCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatProteins, valueTwo: ketoDiet.markProteins))
        
        fatsCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatFats, valueTwo: ketoDiet.markFats))
        
        caloriesCountLabel.text = String(format: "%.0f", setCaloriesRemained(valueOne: ketoDiet.markCalories, valueTwo: ketoDiet.eatCalories))
        
        eatenCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.eatCalories)
        
        burnedCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.burnedCalories)
        
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        
    }
    
    private func setProgressBar(valueOne: Double, valueTwo: Double) -> Double {
        
        if valueOne > valueTwo {
            return 1
        }
        
        return valueOne / valueTwo
        
    }
    
    private func setCaloriesRemained(valueOne: Double, valueTwo: Double) -> Double {
        
        if valueTwo > valueOne {
            return 0
        }
        
        return valueOne - valueTwo
        
    }
    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ЦЕНТРАЛЬНЫЙ ПРОГРЕСС БАР
        
        
        mainCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCalories, valueTwo: ketoDiet.markCalories))
        addSubview(mainCircularView)
        
        mainCircularView.snp.makeConstraints { make in
            // если хочешь поменять расположение по центру, меняй высоту и ширину
            make.height.equalTo(130)
            make.width.equalTo(130)
            make.top.equalTo(self.snp_topMargin).inset(21)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - КАЛОРИИ ЛЕЙБЛ ВНУТРИ КРУГА
        
        let caloriesLabel = UILabel()
        caloriesLabel.text = NSLocalizedString("mainWidget.kcal", comment: "")
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textAlignment = .center
        caloriesLabel.textColor = .white
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.top.equalTo(mainCircularView.snp_topMargin).inset(26)
            make.leading.equalTo(mainCircularView.snp_leadingMargin).inset(44)
        }
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ ЧИСЛО ВНУТРИ КРУГА
        
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
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ СЛОВО ВНУТРИ КРУГА
        
        let caloriesLeftLabel = UILabel()
        caloriesLeftLabel.text = NSLocalizedString("mainWidget.remained", comment: "")
        caloriesLeftLabel.font = .systemFont(ofSize: 12)
        caloriesLeftLabel.textAlignment = .center
        caloriesLeftLabel.textColor = .white
        addSubview(caloriesLeftLabel)
        
        caloriesLeftLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(caloriesCountLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(mainCircularView.snp_leadingMargin).inset(30)
        }
        
        // MARK: - КАРТИНКА ЕДА
        
        let eatImage = UIImage(named: "IconEat")
        let eatImageView = UIImageView(image: eatImage)
        addSubview(eatImageView)
        
        eatImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.3)
        }
        
        // MARK: - СЪЕДЕНО КАЛОРИЙ ЧИСЛО
        
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
        
        // MARK: - СЪЕДЕНО КАЛОРИЙ СЛОВО
        
        let eatenLabel = UILabel()
        eatenLabel.text = NSLocalizedString("mainWidget.eaten", comment: "")
        eatenLabel.font = .systemFont(ofSize: 12)
        eatenLabel.textAlignment = .center
        eatenLabel.textColor = .white
        addSubview(eatenLabel)
        
        eatenLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatenCaloriesCountLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.3)
        }
        
        // MARK: - КАРТИНКА ЧЕЛОВЕЧЕК
        
        let runImage = UIImage(named: "IconRun")
        let runImageView = UIImageView(image: runImage)
        addSubview(runImageView)
        
        runImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.7)
        }
        
        // MARK: - СОЖЖЕНО КАЛОРИЙ ЧИСЛО
        
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
        
        // MARK: - СОЖЖЕНО КАЛОРИЙ СЛОВО
        
        let burnedLabel = UILabel()
        burnedLabel.text = NSLocalizedString("mainWidget.burned", comment: "")
        burnedLabel.font = .systemFont(ofSize: 12)
        burnedLabel.textAlignment = .center
        burnedLabel.textColor = .white
        addSubview(burnedLabel)
        
        burnedLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(burnedCaloriesCountLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.7)
        }
        
        // MARK: - КРУГЛЫЙ УГЛЕВОДЫ ПРОГРЕСС БАР
        
        carbsCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs))
        addSubview(carbsCircularView)
        
        carbsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(44)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.11)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        let carbsLabel = UILabel()
        carbsLabel.text = NSLocalizedString("mainWidget.carbs", comment: "")
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(46)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС ЛЕЙБЛ
        
        
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textColor = .white
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КРУГЛЫЙ БЕЛКИ ПРОГРЕСС БАР
        
        proteinCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatProteins, valueTwo: ketoDiet.markProteins))
        addSubview(proteinCircularView)
        
        proteinCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(44)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.73)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        let proteinsLabel = UILabel()
        proteinsLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinsLabel.textColor = .white
        addSubview(proteinsLabel)
        
        proteinsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(46)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinsProgressLabel.font = .systemFont(ofSize: 12)
        proteinsProgressLabel.textColor = .white
        addSubview(proteinsProgressLabel)
        
        proteinsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КРУГЛЫЙ ЖИРЫ ПРОГРЕСС БАР
        
        fatsCircularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatFats, valueTwo: ketoDiet.markFats))
        addSubview(fatsCircularView)
        
        fatsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(44)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.35)
        }
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        let fatsLabel = UILabel()
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(46)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        
    }
    
    
    
}
