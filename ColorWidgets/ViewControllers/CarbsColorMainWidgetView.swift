//
//  CarbsColorMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CarbsColorMainWidgetView: GradientView, MainWidget {
    
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
            set(colors: [hexColor(hex: "58C3AA").cgColor,
                         hexColor(hex: "92F5C7").cgColor])
        case .greenFlat:
            set(colors: [hexColor(hex: "65D29A").cgColor,
                         hexColor(hex: "65D29A").cgColor])
        }
    }
    
    func update() {
        print("")
    }
    
    private func setupView() {
        
        // круглый прогресс бар
        
        let circularView = CircularProgressView(progressColor: .white, circleColor: .white.withAlphaComponent(0.2), isClosed: false, radius: 66)
//        circularView.progressAnimation(duration: 5, value: 1)
        addSubview(circularView)
        
        circularView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.top.equalTo(self.snp_topMargin).inset(21)
        }
        
        // углеводы
        
        let carbsLabel = UILabel()
        carbsLabel.text = "Углеводы"
        carbsLabel.font = .systemFont(ofSize: 12)
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.leading.equalTo(circularView.snp_leadingMargin).inset(30)
            make.top.equalTo(circularView.snp_topMargin).inset(28)
        }
        
        // количество углеводов
        
        let carbsCountLabel = UILabel()
        carbsCountLabel.text = "15"
        carbsCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        carbsCountLabel.textColor = .white
        addSubview(carbsCountLabel)
        
        carbsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(8)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(40)
        }
        
        // осталось углеводов
        
        let carbsLeftLabel = UILabel()
        carbsLeftLabel.text = """
                                осталось
                                из 18 г
                                """
        carbsLeftLabel.font = .systemFont(ofSize: 12)
        carbsLeftLabel.numberOfLines = 0
        carbsLeftLabel.textAlignment = .center
        carbsLeftLabel.textColor = .white
        addSubview(carbsLeftLabel)
        
        carbsLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsCountLabel.snp_bottomMargin).offset(8)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(32)
        }
        
        // белки
        
        let proteinLabel = UILabel()
        proteinLabel.text = "Белки"
        proteinLabel.font = .systemFont(ofSize: 12)
        proteinLabel.textColor = .white
        addSubview(proteinLabel)
        
        proteinLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(26)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // жиры
        
        let fatsLabel = UILabel()
        fatsLabel.text = "Жиры"
        fatsLabel.font = .systemFont(ofSize: 12)
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // калории
        
        let caloriesLabel = UILabel()
        caloriesLabel.text = "Калории"
        caloriesLabel.font = .systemFont(ofSize: 12)
        caloriesLabel.textColor = .white
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // белки лейбл прогресс
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "155 / 180 г"
        proteinProgressLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinProgressLabel.textColor = .white
        addSubview(proteinProgressLabel)
        
        proteinProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(26)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // жиры лейбл прогресс
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "120 / 150 г"
        fatsProgressLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // калории лейбл прогресс
        
        let caloriesProgressLabel = UILabel()
        caloriesProgressLabel.text = "1580 / 2250 ккал"
        caloriesProgressLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesProgressLabel.textColor = .white
        addSubview(caloriesProgressLabel)
        
        caloriesProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // белки прогресс вью
        
        let proteinProgressBackground = UIView()
        proteinProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        proteinProgressBackground.layer.cornerRadius = 2
        addSubview(proteinProgressBackground)
        
        proteinProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        let proteinProgressBar = UIView()
        proteinProgressBar.backgroundColor = .white
        addSubview(proteinProgressBar)
        
        proteinProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinProgressBackground).multipliedBy(0.5)
            
        }
        
        // жиры прогресс вью
        
        let fatsProgressBackground = UIView()
        fatsProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        fatsProgressBackground.layer.cornerRadius = 2
        addSubview(fatsProgressBackground)
        
        fatsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        let fatsProgressBar = UIView()
        fatsProgressBar.backgroundColor = .white
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(fatsProgressBackground).multipliedBy(0.5)
            
        }
        
        // калории прогресс вью
        
        let caloriesProgressBackground = UIView()
        caloriesProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        caloriesProgressBackground.layer.cornerRadius = 2
        addSubview(caloriesProgressBackground)
        
        caloriesProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        let caloriesProgressBar = UIView()
        caloriesProgressBar.backgroundColor = .white
        addSubview(caloriesProgressBar)
        
        caloriesProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(caloriesProgressBackground).multipliedBy(0.5)
            
        }
        
        // калории в процентах
        
        let caloriesInPercentLabel = UILabel()
        caloriesInPercentLabel.text = "Калории в процентах"
        caloriesInPercentLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesInPercentLabel.textColor = .white
        addSubview(caloriesInPercentLabel)
        
        caloriesInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLeftLabel.snp_bottomMargin).offset(23)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
        }
        
        // общий прогресс бар чтобы наложить остальные на нее
        
        let overallProgressBar = UIView()
        overallProgressBar.layer.cornerRadius = 2
        overallProgressBar.backgroundColor = .white.withAlphaComponent(0)
        addSubview(overallProgressBar)
        
        overallProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
        }
        
        // углеводы в процентах прогресс вью
        
        let carbsProgressBarInPercent = UIView()
        carbsProgressBarInPercent.layer.cornerRadius = 2
        carbsProgressBarInPercent.backgroundColor = .white
        addSubview(carbsProgressBarInPercent)
        
        carbsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(0.35)
        }
        
        // жиры в процентах прогресс вью
        
        let fatsProgressBarInPercent = UIView()
        fatsProgressBarInPercent.layer.cornerRadius = 2
        fatsProgressBarInPercent.backgroundColor = .white
        addSubview(fatsProgressBarInPercent)
        
        fatsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(0.45)
        }
        
        // белки в процентах прогресс вью
        
        let proteinProgressBarInPercent = UIView()
        proteinProgressBarInPercent.layer.cornerRadius = 2
        proteinProgressBarInPercent.backgroundColor = .white
        addSubview(proteinProgressBarInPercent)
        
        proteinProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(0.2)
        }
        
        // углеводы в процентах лейбл
        
        let carbsInPercentLabel = UILabel()
        carbsInPercentLabel.text = "35% углеводы"
        carbsInPercentLabel.font = .systemFont(ofSize: 12)
        carbsInPercentLabel.textColor = .white
        addSubview(carbsInPercentLabel)
        
        carbsInPercentLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp_leadingMargin).inset(24)
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
        }
        
        // жиры в процентах лейбл
        
        let fatsInPercentLabel = UILabel()
        fatsInPercentLabel.text = "45% жиры"
        fatsInPercentLabel.font = .systemFont(ofSize: 12)
        fatsInPercentLabel.textColor = .white
        addSubview(fatsInPercentLabel)
        
        fatsInPercentLabel.snp.makeConstraints { make in
            make.leading.equalTo(carbsInPercentLabel.snp_trailingMargin).offset(50)
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
        }
        
        // белки в процентах лейбл
        
        let proteinsInPercentLabel = UILabel()
        proteinsInPercentLabel.text = "20% белки"
        proteinsInPercentLabel.font = .systemFont(ofSize: 12)
        proteinsInPercentLabel.textColor = .white
        addSubview(proteinsInPercentLabel)
        
        proteinsInPercentLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp_trailingMargin).inset(24)
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
        }
        
    }
    
    
}

