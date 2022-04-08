//
//  CarbsBlackMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CarbsBlackMainWidgetView: GradientView, MainWidget {
    
    let ketoDiet = KetoDiet.getDiet()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        print("")
    }
    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ГЛАВНЫЙ ПРОГРЕСС БАР
        
        let mainCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 45, lineWidth: 14, progressWidth: 14)
        mainCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(mainCircularView)
        
        mainCircularView.snp.makeConstraints { make in
            make.height.equalTo(95)
            make.width.equalTo(95)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.top.equalTo(self.snp_topMargin).inset(21)
        }
        
        // MARK: - ВЫ ДОСТИГЛИ ПРЕДЕЛА ЛЕЙБЛ
        
        let doneLabel = UILabel()
        doneLabel.text = NSLocalizedString("mainWidget.yourMaximum", comment: "")
        doneLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        doneLabel.textColor = .white
        addSubview(doneLabel)
        
        doneLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(28)
            make.leading.equalTo(mainCircularView.snp_trailingMargin).offset(16)
        }
        
        // MARK: - КОЛИЧЕСТВО УГЛЕВОДОВ ОСТАЛОСЬ ЛЕЙБЛ
        
        let carbsLeftLabel = UILabel()
        carbsLeftLabel.text = "\(String(format: "%.0f", (ketoDiet.markCarbs - ketoDiet.eatCarbs))) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.carbsInPlural", comment: "")) \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))"
        carbsLeftLabel.font = .systemFont(ofSize: 14)
        carbsLeftLabel.textColor = .white
        addSubview(carbsLeftLabel)
        
        carbsLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(doneLabel.snp_bottomMargin).offset(16)
            make.leading.equalTo(mainCircularView.snp_trailingMargin).offset(16)
        }
        
        // MARK: - УГЛЕВОДЫ ГЛАВНЫЙ ПРОГРЕСС ЛЕЙБЛ
        
        let carbsMainProgressLabel = UILabel()
        carbsMainProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.eatenSmall", comment: "")) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: "")) \(NSLocalizedString("mainWidget.maximum", comment: ""))"
        carbsMainProgressLabel.font = .systemFont(ofSize: 14)
        carbsMainProgressLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(carbsMainProgressLabel)
        
        carbsMainProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLeftLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(mainCircularView.snp_trailingMargin).offset(16)
        }
        
        
        // MARK: - КРУГЛЫЙ УГЛЕВОДЫ ПРОГРЕСС БАР
        
        let carbsCircularView = CircularProgressView(progressColor: hexColor(hex: "FF794F"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        carbsCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(carbsCircularView)
        
        carbsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(36)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.11)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        let carbsLabel = UILabel()
        carbsLabel.text = NSLocalizedString("mainWidget.carbs", comment: "")
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(38)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС ЛЕЙБЛ
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textColor = .white
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(carbsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КРУГЛЫЙ БЕЛКИ ПРОГРЕСС БАР
        
        let proteinCircularView = CircularProgressView(progressColor: hexColor(hex: "EDDE5A"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        proteinCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(proteinCircularView)
        
        proteinCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(36)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.73)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        let proteinsLabel = UILabel()
        proteinsLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinsLabel.textColor = .white
        addSubview(proteinsLabel)
        
        proteinsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(38)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        let proteinsProgressLabel = UILabel()
        proteinsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinsProgressLabel.font = .systemFont(ofSize: 12)
        proteinsProgressLabel.textColor = .white
        addSubview(proteinsProgressLabel)
        
        proteinsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(proteinCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КРУГЛЫЙ ЖИРЫ ПРОГРЕСС БАР
        
        let fatsCircularView = CircularProgressView(progressColor: hexColor(hex: "49DD58"), circleColor: hexColor(hex: "4F4F4F"), isClosed: true, radius: 17, lineWidth: 5, progressWidth: 5)
        fatsCircularView.progressAnimation(duration: 5, value: 1)
        addSubview(fatsCircularView)
        
        fatsCircularView.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(36)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.35)
        }
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        let fatsLabel = UILabel()
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCircularView.snp_bottomMargin).offset(38)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(14)
            make.leading.equalTo(fatsCircularView.snp_trailingMargin).offset(48)
        }
        
        // MARK: - КАЛОРИИ В ПРОЦЕНТАХ
        
        let caloriesInPercentLabel = UILabel()
        caloriesInPercentLabel.text = NSLocalizedString("mainWidget.сomposition", comment: "")
        caloriesInPercentLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(caloriesInPercentLabel)
        
        caloriesInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsCircularView.snp_bottomMargin).offset(60)
            make.leading.equalTo(self.snp_leadingMargin).inset(10)
        }
        
        // MARK: - ОБЩИЙ ПРОГРЕСС БАР ЧТОБЫ НАЛОЖИТЬ ОСТАЛЬНЫЕ НА НЕЕ
        
        let overallProgressBar = UIView()
        overallProgressBar.layer.cornerRadius = 2
        overallProgressBar.backgroundColor = .white.withAlphaComponent(0)
        addSubview(overallProgressBar)
        
        overallProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.leading.equalTo(self.snp_leadingMargin).inset(10)
            make.trailing.equalTo(self.snp_trailingMargin).inset(20)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        let carbsProgressBarInPercent = UIView()
        carbsProgressBarInPercent.layer.cornerRadius = 2
        carbsProgressBarInPercent.backgroundColor = hexColor(hex: "FF794F")
        addSubview(carbsProgressBarInPercent)
        
        carbsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(10)
            make.width.equalTo(overallProgressBar).multipliedBy(0.35)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        let fatsProgressBarInPercent = UIView()
        fatsProgressBarInPercent.layer.cornerRadius = 2
        fatsProgressBarInPercent.backgroundColor = hexColor(hex: "49DD58")
        addSubview(fatsProgressBarInPercent)
        
        fatsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(0.45)
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        let proteinProgressBarInPercent = UIView()
        proteinProgressBarInPercent.layer.cornerRadius = 2
        proteinProgressBarInPercent.backgroundColor = hexColor(hex: "49DD58")
        addSubview(proteinProgressBarInPercent)
        
        proteinProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(0.2)
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        let carbsInPercentLabel = UILabel()
        carbsInPercentLabel.text = "35% \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        carbsInPercentLabel.font = .systemFont(ofSize: 12)
        carbsInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(carbsInPercentLabel)
        
        carbsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        let fatsInPercentLabel = UILabel()
        fatsInPercentLabel.text = "45% \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        fatsInPercentLabel.font = .systemFont(ofSize: 12)
        fatsInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(fatsInPercentLabel)
        
        fatsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        let proteinsInPercentLabel = UILabel()
        proteinsInPercentLabel.text = "20% \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        proteinsInPercentLabel.font = .systemFont(ofSize: 12)
        proteinsInPercentLabel.textColor = hexColor(hex: "A9A9A9")
        addSubview(proteinsInPercentLabel)
        
        proteinsInPercentLabel.snp.makeConstraints { make in            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
    }
}
