//
//  CarbsBlackMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CarbsBlackMainWidgetView: GradientView, MainWidget {
    
    var ketoDiet = KetoDiet.getDiet()
    
    private var mainCircularView: CircularProgressView!
    private var carbsCircularView: CircularProgressView!
    private var proteinCircularView: CircularProgressView!
    private var fatsCircularView: CircularProgressView!
    
    private let carbsLeftLabel = UILabel()
    private let carbsMainProgressLabel = UILabel()
    private let carbsProgressLabel = UILabel()
    private let proteinsProgressLabel = UILabel()
    private let fatsProgressLabel = UILabel()
    
    private let caloriesInPercentLabel = UILabel()
    private let overallProgressBar = UIView()
    private let carbsProgressBarInPercent = UIView()
    private let fatsProgressBarInPercent = UIView()
    private let proteinProgressBarInPercent = UIView()
    private let carbsInPercentLabel = UILabel()
    private let fatsInPercentLabel = UILabel()
    private let proteinsInPercentLabel = UILabel()
    private let doneLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mainCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 45, lineWidth: 14, progressWidth: 14)
        self.carbsCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        self.proteinCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        self.fatsCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        
        set(cornerRadius: 25)
        set(maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
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
        
        mainCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        
        carbsCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        
        proteinCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatProteins, valueTwo: ketoDiet.markProteins), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        
        fatsCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatFats, valueTwo: ketoDiet.markFats), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        
        doneLabel.text = returnDoneLabel()
        
        carbsLeftLabel.text = "\(String(format: "%.0f", setCarbsRemained(valueOne: ketoDiet.markCarbs, valueTwo: ketoDiet.eatCarbs))) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.carbsInPlural", comment: "")) \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))"
        
        carbsMainProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.eatenSmall", comment: "")) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.maximum", comment: ""))"
        
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        carbsInPercentLabel.text = "\(getPercent(value: ketoDiet.markCarbs / getSumOfPFC())) \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        
        fatsInPercentLabel.text = "\(getPercent(value: ketoDiet.markFats / getSumOfPFC())) \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        
        proteinsInPercentLabel.text = "\(getPercent(value: ketoDiet.markProteins / getSumOfPFC())) \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        
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
        
        proteinProgressBarInPercent.snp.remakeConstraints { make in
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
    
    
    private func setProgressBar(valueOne: Double, valueTwo: Double) -> Double {
        
        if valueOne > valueTwo {
            return 1
        }
        
        return valueOne / valueTwo
        
    }
    
    private func setCarbsRemained(valueOne: Double, valueTwo: Double) -> Double {
        
        if valueTwo > valueOne {
            return 0
        }
        
        return valueOne - valueTwo
        
    }
    
    private func checkCarbs(eatCarbs: Double, markCarbs: Double) -> Bool {
        
        if eatCarbs >= markCarbs {
            
            return true
        }
        
        return false
        
    }
    
    private func returnDoneLabel() -> String {
        
        checkCarbs(eatCarbs: ketoDiet.eatCarbs, markCarbs: ketoDiet.markCarbs) ? NSLocalizedString("mainWidget.yourMaximum", comment: "") : NSLocalizedString("mainWidget.yourPlan", comment: "")
        
    }
    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ГЛАВНЫЙ ПРОГРЕСС БАР
        
        mainCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        addSubview(mainCircularView)
        
        mainCircularView.snp.makeConstraints { make in
            make.height.equalTo(95)
            make.width.equalTo(95)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.top.equalTo(self.snp_topMargin).inset(28)
        }
        
        // MARK: - ВЫ ДОСТИГЛИ ПРЕДЕЛА ЛЕЙБЛ
        
        
        doneLabel.text = returnDoneLabel()
        doneLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        doneLabel.textColor = .white
        addSubview(doneLabel)
        
        doneLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(32)
            make.leading.equalTo(mainCircularView.snp_trailingMargin).offset(18)
        }
        
        // MARK: - КОЛИЧЕСТВО УГЛЕВОДОВ ОСТАЛОСЬ ЛЕЙБЛ
        
        
        carbsLeftLabel.text = "\(String(format: "%.0f", setCarbsRemained(valueOne: ketoDiet.markCarbs, valueTwo: ketoDiet.eatCarbs))) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.carbsInPlural", comment: "")) \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))"
        carbsLeftLabel.font = .systemFont(ofSize: 14)
        carbsLeftLabel.textColor = .white
        addSubview(carbsLeftLabel)
        
        carbsLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(doneLabel.snp_bottomMargin).offset(20)
            make.leading.equalTo(mainCircularView.snp_trailingMargin).offset(20)
        }
        
        // MARK: - УГЛЕВОДЫ ГЛАВНЫЙ ПРОГРЕСС ЛЕЙБЛ
        
        
        carbsMainProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.eatenSmall", comment: "")) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.maximum", comment: ""))"
        carbsMainProgressLabel.font = .systemFont(ofSize: 14)
        carbsMainProgressLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(carbsMainProgressLabel)
        
        carbsMainProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLeftLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(mainCircularView.snp_trailingMargin).offset(20)
        }
        
        
        // MARK: - КРУГЛЫЙ УГЛЕВОДЫ ПРОГРЕСС БАР
        

        carbsCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        addSubview(carbsCircularView)
        
        carbsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(34)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.11)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        let carbsLabel = UILabel()
        carbsLabel.text = NSLocalizedString("mainWidget.carbs", comment: "")
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(36)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС ЛЕЙБЛ
        
        
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textColor = .white
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КРУГЛЫЙ БЕЛКИ ПРОГРЕСС БАР
        
        proteinCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatProteins, valueTwo: ketoDiet.markProteins), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        addSubview(proteinCircularView)
        
        proteinCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(34)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.73)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        let proteinsLabel = UILabel()
        proteinsLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinsLabel.textColor = .white
        addSubview(proteinsLabel)
        
        proteinsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(36)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinsProgressLabel.font = .systemFont(ofSize: 12)
        proteinsProgressLabel.textColor = .white
        addSubview(proteinsProgressLabel)
        
        proteinsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КРУГЛЫЙ ЖИРЫ ПРОГРЕСС БАР
        
        
        fatsCircularView.progressAndColorAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatFats, valueTwo: ketoDiet.markFats), greenColor: hexColor(hex: "49DD58"), yellowColor: hexColor(hex: "EDDE5A"), redColor: hexColor(hex: "FF794F"))
        addSubview(fatsCircularView)
        
        fatsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(34)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.35)
        }
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        let fatsLabel = UILabel()
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(36)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КАЛОРИИ В ПРОЦЕНТАХ
        
        caloriesInPercentLabel.text = NSLocalizedString("mainWidget.сomposition", comment: "")
        caloriesInPercentLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(caloriesInPercentLabel)
        
        caloriesInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsCircularView.snp_bottomMargin).offset(56)
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
        carbsProgressBarInPercent.backgroundColor = hexColor(hex: "FF794F")
        addSubview(carbsProgressBarInPercent)
        
        carbsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markCarbs / getSumOfPFC())
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        fatsProgressBarInPercent.layer.cornerRadius = 2
        fatsProgressBarInPercent.backgroundColor = hexColor(hex: "49DD58")
        addSubview(fatsProgressBarInPercent)
        
        fatsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markFats / getSumOfPFC())
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        proteinProgressBarInPercent.layer.cornerRadius = 2
        proteinProgressBarInPercent.backgroundColor = hexColor(hex: "49DD58")
        addSubview(proteinProgressBarInPercent)
        
        proteinProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markProteins / getSumOfPFC())
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        carbsInPercentLabel.text = "\(getPercent(value: ketoDiet.markCarbs / getSumOfPFC())) \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        carbsInPercentLabel.font = .systemFont(ofSize: 12)
        carbsInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(carbsInPercentLabel)
        
        carbsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(14)
            make.leading.equalTo(self.snp_leadingMargin).inset(22)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        fatsInPercentLabel.text = "\(getPercent(value: ketoDiet.markFats / getSumOfPFC())) \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        fatsInPercentLabel.font = .systemFont(ofSize: 12)
        fatsInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(fatsInPercentLabel)
        
        fatsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        proteinsInPercentLabel.text = "\(getPercent(value: ketoDiet.markProteins / getSumOfPFC())) \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        proteinsInPercentLabel.font = .systemFont(ofSize: 12)
        proteinsInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(proteinsInPercentLabel)
        
        proteinsInPercentLabel.snp.makeConstraints { make in            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(14)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
    }
}
