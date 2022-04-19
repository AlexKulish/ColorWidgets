//
//  CaloriesWhiteMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CaloriesWhiteMainWidgetView: GradientView, MainWidget {
    
    var ketoDiet = KetoDiet.getDiet()
    
    // MARK: - ПРИВАТНЫЕ СВОЙСТВА
    
    private var circularView: CircularProgressView! // ! для пробы
    
    private let caloriesCountLabel = UILabel()
    private let eatenCaloriesCountLabel = UILabel()
    private let burnedCaloriesCountLabel = UILabel()
    
    private let proteinsLabel = UILabel()
    private let carbsLabel = UILabel()
    private let fatsLabel = UILabel()
    
    private let overallProgressBar = UIView()
    private let carbsProgressBackground = UIView()
    private let carbsProgressBar = UIView()
    private let proteinsProgressBackground = UIView()
    private let proteinsProgressBar = UIView()
    private let fatsProgressBackground = UIView()
    private let fatsProgressBar = UIView()
    
    private let carbsProgressLabel = UILabel()
    private let proteinsProgressLabel = UILabel()
    private let fatsProgressLabel = UILabel()
    
    // MARK: - ИНИЦИАЛИЗАТОРЫ
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        circularView = CircularProgressView(firstColor: hexColor(hex: "FCAD80"), secondColor: hexColor(hex: "F8637E"))
        set(cornerRadius: 25)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ПУБЛИЧНЫЕ МЕТОДЫ
    
    func set(theme: ColorTheme) {
        switch theme {
        case .orangeGradient:
            circularView.createGradientCircularPath(firstColor: hexColor(hex: "FCAD80"), secondColor: hexColor(hex: "F8637E"))
        case .orangeFlat:
            circularView.createGradientCircularPath(firstColor: hexColor(hex: "FCAD80"), secondColor: hexColor(hex: "F8637E"))
        case .greenGradient:
            circularView.createGradientCircularPath(firstColor: hexColor(hex: "92F5C7"), secondColor: hexColor(hex: "58C3AA"))
        case .greenFlat:
            circularView.createGradientCircularPath(firstColor: hexColor(hex: "92F5C7"), secondColor: hexColor(hex: "58C3AA"))
        }
    }
    
    func update() {
        
        circularView.progressAnimation(duration: 5, value: setProgressBar(eatValue: ketoDiet.eatCalories, markValue: ketoDiet.markCalories))
        
        caloriesCountLabel.text = String(format: "%.0f", setCaloriesRemained(markValue: ketoDiet.markCalories, eatValue: ketoDiet.eatCalories))
        
        eatenCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.eatCalories)
        
        burnedCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.burnedCalories)
        
        carbsProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(carbsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatCarbs, markValue: ketoDiet.markCarbs))
        }
        
        proteinsProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(proteinsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatProteins, markValue: ketoDiet.markProteins))
        }
        
        fatsProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(proteinsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(fatsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatFats, markValue: ketoDiet.markFats))
        }
        
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                    self.layoutIfNeeded()
                }
        
    }
    
    // MARK: - ПРИВАТНЫЕ МЕТОДЫ
    
    private func setProgressBar(eatValue: Double, markValue: Double) -> Double {
        
        if eatValue > markValue {
            return 1
        }
        
        return eatValue / markValue
        
    }
    
    private func setCaloriesRemained(markValue: Double, eatValue: Double) -> Double {
        
        if eatValue > markValue {
            return 0
        }
        
        return markValue - eatValue
        
    }
    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ЦЕНТРАЛЬНЫЙ ПРОГРЕСС БАР
        
        circularView.progressAnimation(duration: 5, value: setProgressBar(eatValue: ketoDiet.eatCalories, markValue: ketoDiet.markCalories))
        addSubview(circularView)
        
        circularView.snp.makeConstraints { make in
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
        caloriesLabel.textColor = .black
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.top.equalTo(circularView.snp_topMargin).inset(20)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(44)
        }
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ ЧИСЛО ВНУТРИ КРУГА
        
        caloriesCountLabel.text = String(format: "%.0f", setCaloriesRemained(markValue: ketoDiet.markCalories, eatValue: ketoDiet.eatCalories))
        caloriesCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        caloriesCountLabel.textAlignment = .center
        caloriesCountLabel.textColor = .black
        addSubview(caloriesCountLabel)
        
        caloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(10)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(20)
        }
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ СЛОВО ВНУТРИ КРУГА
        
        let caloriesRemainsLabel = UILabel()
        caloriesRemainsLabel.text = NSLocalizedString("mainWidget.remained", comment: "")
        caloriesRemainsLabel.font = .systemFont(ofSize: 12)
        caloriesRemainsLabel.textAlignment = .center
        caloriesRemainsLabel.textColor = .black
        addSubview(caloriesRemainsLabel)
        
        caloriesRemainsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(caloriesCountLabel.snp_bottomMargin).offset(6)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(30)
        }
        
        // MARK: - КАРТИНКА ЕДА
        
        let eatImage = UIImage(named: "IconEatBlack")
        let eatImageView = UIImageView(image: eatImage)
        addSubview(eatImageView)
        
        eatImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(50)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - СЪЕДЕНО КАЛОРИЙ ЧИСЛО
        
        eatenCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.eatCalories)
        eatenCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        eatenCaloriesCountLabel.textAlignment = .center
        eatenCaloriesCountLabel.textColor = .black
        addSubview(eatenCaloriesCountLabel)
        
        eatenCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatImageView.snp_bottomMargin).offset(8)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - СЪЕДЕНО КАЛОРИЙ СЛОВО
        
        let eatenLabel = UILabel()
        eatenLabel.text = NSLocalizedString("mainWidget.eaten", comment: "")
        eatenLabel.font = .systemFont(ofSize: 12)
        eatenLabel.textAlignment = .center
        eatenLabel.textColor = .black
        addSubview(eatenLabel)
        
        eatenLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatenCaloriesCountLabel.snp_bottomMargin).offset(8)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - КАРТИНКА ЧЕЛОВЕЧЕК
        
        let runImage = UIImage(named: "IconRunBlack")
        let runImageView = UIImageView(image: runImage)
        addSubview(runImageView)
        
        runImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(50)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - СОЖЖЕНО КАЛОРИЙ ЧИСЛО
        
        burnedCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.burnedCalories)
        burnedCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        burnedCaloriesCountLabel.textAlignment = .center
        burnedCaloriesCountLabel.textColor = .black
        addSubview(burnedCaloriesCountLabel)
        
        burnedCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(runImageView.snp_bottomMargin).offset(8)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - СОЖЖЕНО КАЛОРИЙ СЛОВО
        
        let burnedLabel = UILabel()
        burnedLabel.text = NSLocalizedString("mainWidget.burned", comment: "")
        burnedLabel.font = .systemFont(ofSize: 12)
        burnedLabel.textAlignment = .center
        burnedLabel.textColor = .black
        addSubview(burnedLabel)
        
        burnedLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(burnedCaloriesCountLabel.snp_bottomMargin).offset(8)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        proteinsLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinsLabel.textAlignment = .center
        proteinsLabel.textColor = .black
        addSubview(proteinsLabel)
        
        proteinsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        carbsLabel.text = NSLocalizedString("mainWidget.carbs", comment: "")
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textAlignment = .center
        carbsLabel.textColor = .black
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.4)
        }
        
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textAlignment = .center
        fatsLabel.textColor = .black
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.6)
        }
        
        // MARK: - ОБЩИЙ ПРОГРЕСС БАР ЧТОБЫ НАЛОЖИТЬ ОСТАЛЬНЫЕ НА НЕЕ
        
        overallProgressBar.layer.cornerRadius = 2
        overallProgressBar.backgroundColor = .white.withAlphaComponent(0)
        addSubview(overallProgressBar)
        
        overallProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.trailing.equalTo(self.snp_trailingMargin).inset(16)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(14)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС БАР
        
        carbsProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        carbsProgressBackground.layer.cornerRadius = 2
        addSubview(carbsProgressBackground)
        
        carbsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(0.3)
        }
        
        carbsProgressBar.backgroundColor = hexColor(hex: "F79498")
        carbsProgressBar.layer.cornerRadius = 2
        addSubview(carbsProgressBar)
        
        carbsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(carbsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatCarbs, markValue: ketoDiet.markCarbs))
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС БАР
        
        proteinsProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        proteinsProgressBackground.layer.cornerRadius = 2
        addSubview(proteinsProgressBackground)
        
        proteinsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(overallProgressBar).multipliedBy(0.3)
        }
        
        proteinsProgressBar.backgroundColor = hexColor(hex: "FDBE7D")
        proteinsProgressBar.layer.cornerRadius = 2
        addSubview(proteinsProgressBar)
        
        proteinsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(proteinsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatProteins, markValue: ketoDiet.markProteins))
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС БАР
        
        fatsProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        fatsProgressBackground.layer.cornerRadius = 2
        addSubview(fatsProgressBackground)
        
        fatsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(proteinsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(overallProgressBar).multipliedBy(0.33)
        }
        
        fatsProgressBar.backgroundColor = hexColor(hex: "B5B3DC")
        fatsProgressBar.layer.cornerRadius = 2
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(proteinsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(fatsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatFats, markValue: ketoDiet.markFats))
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС ЛЕЙБЛ
        
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textAlignment = .center
        carbsProgressLabel.textColor = .black
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.4)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinsProgressLabel.font = .systemFont(ofSize: 12)
        proteinsProgressLabel.textAlignment = .center
        proteinsProgressLabel.textColor = .black
        addSubview(proteinsProgressLabel)
        
        proteinsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textAlignment = .center
        fatsProgressLabel.textColor = .black
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.6)
        }
    }
}
