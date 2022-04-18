//
//  CarbsColorMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CarbsColorMainWidgetView: GradientView, MainWidget {
    
    var ketoDiet = KetoDiet.getDiet()
    
    private let circularView = CircularProgressView(progressColor: .white, circleColor: .white.withAlphaComponent(0.2), isClosed: false, radius: 66)
    
    private let proteinsLabel = UILabel()
    private let proteinsProgressLabel = UILabel()
    private let proteinsProgressBackground = UIView()
    private let proteinsProgressBar = UIView()
    
    private let fatsLabel = UILabel()
    private let fatsProgressLabel = UILabel()
    private let fatsProgressBackground = UIView()
    private let fatsProgressBar = UIView()
    
    private let caloriesLabel = UILabel()
    private let caloriesProgressLabel = UILabel()
    private let caloriesProgressBackground = UIView()
    private let caloriesProgressBar = UIView()
    
    private let carbsCountLabel = UILabel()
    private let carbsRemainsLabel = UILabel()
    
    private let caloriesInPercentLabel = UILabel()
    private let overallProgressBar = UIView()
    private let carbsProgressBarInPercent = UIView()
    private let fatsProgressBarInPercent = UIView()
    private let proteinsProgressBarInPercent = UIView()
    private let carbsInPercentLabel = UILabel()
    private let fatsInPercentLabel = UILabel()
    private let proteinsInPercentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set(cornerRadius: 25)
        setupView()
        set(theme: .orangeGradient)
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
        circularView.progressAnimation(duration: 5, value: setProgressBar(eatValue: ketoDiet.eatCarbs, markValue: ketoDiet.markCarbs))
        
        carbsCountLabel.text = "\(String(format: "%.0f", setCarbsRemained(markValue: ketoDiet.markCarbs, eatValue: ketoDiet.eatCarbs)))"
        
        carbsRemainsLabel.text = """
                                \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))
                                \(NSLocalizedString("mainWidget.from", comment: "")) \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))
                                """
        
        
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        caloriesProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCalories)) / \(String(format: "%.0f", ketoDiet.markCalories)) \(NSLocalizedString("mainWidget.kcal", comment: ""))"
        
        carbsInPercentLabel.text = "\(getPercent(value: ketoDiet.markCarbs / getSumOfPFC())) \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        
        fatsInPercentLabel.text = "\(getPercent(value: ketoDiet.markFats / getSumOfPFC())) \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        
        proteinsInPercentLabel.text = "\(getPercent(value: ketoDiet.markProteins / getSumOfPFC())) \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        
        proteinsProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatProteins, markValue: ketoDiet.markProteins))
        }
        
        fatsProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(fatsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatFats, markValue: ketoDiet.markFats))
            
        }
        
        caloriesProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(caloriesProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatCalories, markValue: ketoDiet.markCalories))
            
        }
        
        carbsProgressBarInPercent.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markCarbs / getSumOfPFC())
        }
        
        fatsProgressBarInPercent.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markFats / getSumOfPFC())
        }
        
        proteinsProgressBarInPercent.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markProteins / getSumOfPFC())
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                    self.layoutIfNeeded()
                }
    }
    
    private func getPercent(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 2
        formatter.maximumFractionDigits = 1
        formatter.roundingMode = .halfUp
        formatter.roundingIncrement = 1
        
        return formatter.string(from: NSNumber(value: value)) ?? ""
        
    }
    
    private func getSumOfPFC() -> Double {
        ketoDiet.markProteins + ketoDiet.markCarbs + ketoDiet.markFats
    }
    
    private func setProgressBar(eatValue: Double, markValue: Double) -> Double {
        
        if eatValue > markValue {
            return 1
        }
        
        return eatValue / markValue
        
    }
    
    private func setCarbsRemained(markValue: Double, eatValue: Double) -> Double {
        
        if eatValue > markValue {
            return 0
        }
        
        return markValue - eatValue
        
    }
    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ПРОГРЕСС БАР
        
        circularView.progressAnimation(duration: 5, value: setProgressBar(eatValue: ketoDiet.eatCarbs, markValue: ketoDiet.markCarbs))
        addSubview(circularView)
        
        circularView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.top.equalTo(self.snp_topMargin).inset(21)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        let carbsLabel = UILabel()
        carbsLabel.text = NSLocalizedString("mainWidget.carbs", comment: "")
        carbsLabel.textAlignment = .center
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(28)
            make.top.equalTo(circularView.snp_topMargin).inset(20)
        }
        
        // MARK: - КОЛИЧЕСТВО УГЛЕВОДОВ
        
        carbsCountLabel.text = "\(String(format: "%.0f", setCarbsRemained(markValue: ketoDiet.markCarbs, eatValue: ketoDiet.eatCarbs)))"
        carbsCountLabel.textAlignment = .center
        carbsCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        carbsCountLabel.textColor = .white
        addSubview(carbsCountLabel)
        
        carbsCountLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(10)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(10)
        }
        
        // MARK: - ОСТАЛОСЬ УГЛЕВОДОВ
        
        carbsRemainsLabel.text = """
                                \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))
                                \(NSLocalizedString("mainWidget.from", comment: "")) \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))
                                """
        carbsRemainsLabel.font = .systemFont(ofSize: 12)
        carbsRemainsLabel.numberOfLines = 0
        carbsRemainsLabel.textAlignment = .center
        carbsRemainsLabel.textColor = .white
        addSubview(carbsRemainsLabel)
        
        carbsRemainsLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.top.equalTo(carbsCountLabel.snp_bottomMargin).offset(10)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(24)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        proteinsLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinsLabel.textColor = .white
        addSubview(proteinsLabel)
        
        proteinsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(18)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - КАЛОРИИ ЛЕЙБЛ
        
        caloriesLabel.text = NSLocalizedString("mainWidget.calories", comment: "")
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textColor = .white
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinsProgressLabel.font = .systemFont(ofSize: 12)
        proteinsProgressLabel.textColor = .white
        addSubview(proteinsProgressLabel)
        
        proteinsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(18)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinsProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - КАЛОРИИ ПРОГРЕСС ЛЕЙБЛ
        
        caloriesProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCalories)) / \(String(format: "%.0f", ketoDiet.markCalories)) \(NSLocalizedString("mainWidget.kcal", comment: ""))"
        caloriesProgressLabel.font = .systemFont(ofSize: 12)
        caloriesProgressLabel.textColor = .white
        addSubview(caloriesProgressLabel)
        
        caloriesProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС БАР
        
        proteinsProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        proteinsProgressBackground.layer.cornerRadius = 2
        addSubview(proteinsProgressBackground)
        
        proteinsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        proteinsProgressBar.backgroundColor = .white
        proteinsProgressBar.layer.cornerRadius = 2
        addSubview(proteinsProgressBar)
        
        proteinsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinsLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatProteins, markValue: ketoDiet.markProteins))
            
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС БАР
        
        fatsProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        fatsProgressBackground.layer.cornerRadius = 2
        addSubview(fatsProgressBackground)
        
        fatsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        fatsProgressBar.backgroundColor = .white
        fatsProgressBar.layer.cornerRadius = 2
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(fatsProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatFats, markValue: ketoDiet.markFats))
            
        }
        
        // MARK: - КАЛОРИИ ПРОГРЕСС БАР
        
        caloriesProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        caloriesProgressBackground.layer.cornerRadius = 2
        addSubview(caloriesProgressBackground)
        
        caloriesProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        caloriesProgressBar.backgroundColor = .white
        caloriesProgressBar.layer.cornerRadius = 2
        addSubview(caloriesProgressBar)
        
        caloriesProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(13)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(caloriesProgressBackground).multipliedBy(setProgressBar(eatValue: ketoDiet.eatCalories, markValue: ketoDiet.markCalories))
            
        }
        
        // MARK: - КАЛОРИИ В ПРОЦЕНТАХ
        
        caloriesInPercentLabel.text = NSLocalizedString("mainWidget.сomposition", comment: "")
        caloriesInPercentLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesInPercentLabel.textColor = .white
        addSubview(caloriesInPercentLabel)
        
        caloriesInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsRemainsLabel.snp_bottomMargin).offset(32)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
        }
        
        // MARK: - ОБЩИЙ ПРОГРЕСС БАР ЧТОБЫ НАЛОЖИТЬ ОСТАЛЬНЫЕ НА НЕЕ
        
        overallProgressBar.layer.cornerRadius = 2
        overallProgressBar.backgroundColor = .white.withAlphaComponent(0)
        addSubview(overallProgressBar)
        
        overallProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.trailing.equalTo(self.snp_trailingMargin).inset(20)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        carbsProgressBarInPercent.layer.cornerRadius = 2
        carbsProgressBarInPercent.backgroundColor = .white
        addSubview(carbsProgressBarInPercent)
        
        carbsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markCarbs / getSumOfPFC())
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        fatsProgressBarInPercent.layer.cornerRadius = 2
        fatsProgressBarInPercent.backgroundColor = .white
        addSubview(fatsProgressBarInPercent)
        
        fatsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markFats / getSumOfPFC())
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        proteinsProgressBarInPercent.layer.cornerRadius = 2
        proteinsProgressBarInPercent.backgroundColor = .white
        addSubview(proteinsProgressBarInPercent)
        
        proteinsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markProteins / getSumOfPFC())
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        carbsInPercentLabel.text = "\(getPercent(value: ketoDiet.markCarbs / getSumOfPFC())) \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        carbsInPercentLabel.font = .systemFont(ofSize: 12)
        carbsInPercentLabel.textColor = .white
        addSubview(carbsInPercentLabel)
        
        carbsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(22)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        fatsInPercentLabel.text = "\(getPercent(value: ketoDiet.markFats / getSumOfPFC())) \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        fatsInPercentLabel.font = .systemFont(ofSize: 12)
        fatsInPercentLabel.textColor = .white
        addSubview(fatsInPercentLabel)
        
        fatsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        proteinsInPercentLabel.text = "\(getPercent(value: ketoDiet.markProteins / getSumOfPFC())) \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        proteinsInPercentLabel.font = .systemFont(ofSize: 12)
        proteinsInPercentLabel.textColor = .white
        addSubview(proteinsInPercentLabel)
        
        proteinsInPercentLabel.snp.makeConstraints { make in            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
    }
    
    
}

