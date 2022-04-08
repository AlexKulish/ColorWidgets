//
//  CarbsWhiteMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CarbsWhiteMainWidgetView: GradientView, MainWidget {
    
    let ketoDiet = KetoDiet.getDiet()
    
    private var circularView: CircularProgressView! // ! для пробы
    
//    let circularView = CircularProgressView(progressColor: .red, circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
    
//    let circularView = CircularProgressView()
    
    let proteinLabel = UILabel()
    let proteinProgressBackground = UIView()
    let proteinProgressBar = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circularView = CircularProgressView(progressColor: setProgressColor("FCAD80"), circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
        set(cornerRadius: 25)
        setupView()
//        set(theme: .orangeGradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgressColor(_ hexOne: String) -> UIColor {
        hexColor(hex: hexOne)
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
        
        proteinProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinProgressBackground).multipliedBy(0.9)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                    self.layoutIfNeeded()
                }
        
    }

    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ПРОГРЕСС БАР
        
//        let circularView = CircularProgressView(progressColor: .red, circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
        circularView.progressAnimation(duration: 5, value: 1)
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
        carbsLabel.textColor = .black
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(28)
            make.top.equalTo(circularView.snp_topMargin).inset(20)
        }
        
        // MARK: - КОЛИЧЕСТВО УГЛЕВОДОВ
        
        let carbsCountLabel = UILabel()
        
        carbsCountLabel.text = "\(String(format: "%.0f", (ketoDiet.markCarbs - ketoDiet.eatCarbs)))"
        carbsCountLabel.textAlignment = .center
        carbsCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        carbsCountLabel.textColor = .black
        addSubview(carbsCountLabel)
        
        carbsCountLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(8)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(10)
        }
        
        // MARK: - ОСТАЛОСЬ УГЛЕВОДОВ
        
        let carbsLeftLabel = UILabel()
        carbsLeftLabel.text = """
                                \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))
                                \(NSLocalizedString("mainWidget.from", comment: "")) \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))
                                """
        carbsLeftLabel.font = .systemFont(ofSize: 12)
        carbsLeftLabel.numberOfLines = 0
        carbsLeftLabel.textAlignment = .center
        carbsLeftLabel.textColor = .black
        addSubview(carbsLeftLabel)
        
        carbsLeftLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(carbsCountLabel.snp_bottomMargin).offset(8)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(30)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
//        let proteinLabel = UILabel()
        proteinLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinLabel.textColor = .black
        addSubview(proteinLabel)
        
        proteinLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(26)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        let fatsLabel = UILabel()
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .black
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - КАЛОРИИ ЛЕЙБЛ
        
        let caloriesLabel = UILabel()
        caloriesLabel.text = NSLocalizedString("mainWidget.calories", comment: "")
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textColor = .black
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinProgressLabel.font = .systemFont(ofSize: 12)
        proteinProgressLabel.textColor = .black
        addSubview(proteinProgressLabel)
        
        proteinProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(26)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .black
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - КАЛОРИИ ПРОГРЕСС ЛЕЙБЛ
        
        let caloriesProgressLabel = UILabel()
        caloriesProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCalories)) / \(String(format: "%.0f", ketoDiet.markCalories)) \(NSLocalizedString("mainWidget.kcal", comment: ""))"
        caloriesProgressLabel.font = .systemFont(ofSize: 12)
        caloriesProgressLabel.textColor = .black
        addSubview(caloriesProgressLabel)
        
        caloriesProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС БАР
        
//        let proteinProgressBackground = UIView()
        proteinProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        proteinProgressBackground.layer.cornerRadius = 2
        addSubview(proteinProgressBackground)
        
        proteinProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
//        let proteinProgressBar = UIView()
        proteinProgressBar.backgroundColor = hexColor(hex: "FDBE7D")
        addSubview(proteinProgressBar)
        
        proteinProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinProgressBackground).multipliedBy(0.5)
            
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС БАР
        
        let fatsProgressBackground = UIView()
        fatsProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        fatsProgressBackground.layer.cornerRadius = 2
        addSubview(fatsProgressBackground)
        
        fatsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        let fatsProgressBar = UIView()
        fatsProgressBar.backgroundColor = hexColor(hex: "B5B3DC")
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(fatsProgressBackground).multipliedBy(0.5)
            
        }
        
        // MARK: - КАЛОРИИ ПРОГРЕСС БАР
        
        let caloriesProgressBackground = UIView()
        caloriesProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        caloriesProgressBackground.layer.cornerRadius = 2
        addSubview(caloriesProgressBackground)
        
        caloriesProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        let caloriesProgressBar = UIView()
        caloriesProgressBar.backgroundColor = hexColor(hex: "F79498")
        addSubview(caloriesProgressBar)
        
        caloriesProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(caloriesProgressBackground).multipliedBy(0.5)
            
        }
        
        // MARK: - КАЛОРИИ В ПРОЦЕНТАХ
        
        let caloriesInPercentLabel = UILabel()
        caloriesInPercentLabel.text = NSLocalizedString("mainWidget.сomposition", comment: "")
        caloriesInPercentLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesInPercentLabel.textColor = .black
        addSubview(caloriesInPercentLabel)
        
        caloriesInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLeftLabel.snp_bottomMargin).offset(23)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
        }
        
        // MARK: - ОБЩИЙ ПРОГРЕСС БАР ЧТОБЫ НАЛОЖИТЬ ОСТАЛЬНЫЕ НА НЕЕ
        
        let overallProgressBar = UIView()
        overallProgressBar.layer.cornerRadius = 2
        overallProgressBar.backgroundColor = .white.withAlphaComponent(0)
        addSubview(overallProgressBar)
        
        overallProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.trailing.equalTo(self.snp_trailingMargin).inset(20)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        let carbsProgressBarInPercent = UIView()
        carbsProgressBarInPercent.layer.cornerRadius = 2
        carbsProgressBarInPercent.backgroundColor = hexColor(hex: "F9440B")
        addSubview(carbsProgressBarInPercent)
        
        carbsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(0.35)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        let fatsProgressBarInPercent = UIView()
        fatsProgressBarInPercent.layer.cornerRadius = 2
        fatsProgressBarInPercent.backgroundColor = hexColor(hex: "91D0B6")
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
        proteinProgressBarInPercent.backgroundColor = hexColor(hex: "91D0B6")
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
        carbsInPercentLabel.textColor = .black
        addSubview(carbsInPercentLabel)
        
        carbsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        let fatsInPercentLabel = UILabel()
        fatsInPercentLabel.text = "45% \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        fatsInPercentLabel.font = .systemFont(ofSize: 12)
        fatsInPercentLabel.textColor = .black
        addSubview(fatsInPercentLabel)
        
        fatsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        let proteinsInPercentLabel = UILabel()
        proteinsInPercentLabel.text = "20% \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        proteinsInPercentLabel.font = .systemFont(ofSize: 12)
        proteinsInPercentLabel.textColor = .black
        addSubview(proteinsInPercentLabel)
        
        proteinsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        
    }
    
    
    
}
