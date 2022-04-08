//
//  CaloriesColorMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CaloriesColorMainWidgetView: GradientView, MainWidget {
    
    private let ketoDiet = KetoDiet.getDiet()
    
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
        
        // MARK: - КРУГЛЫЙ ЦЕНТРАЛЬНЫЙ ПРОГРЕСС БАР
        
        let circularView = CircularProgressView(progressColor: .white, circleColor: .white.withAlphaComponent(0.2), isClosed: false, radius: 66)
        circularView.progressAnimation(duration: 5, value: 1)
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
        caloriesLabel.textColor = .white
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.top.equalTo(circularView.snp_topMargin).inset(22)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(44)
        }
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ ЧИСЛО ВНУТРИ КРУГА
        
        let caloriesCountLabel = UILabel()
        caloriesCountLabel.text = String(format: "%.0f", ketoDiet.markCalories)
        caloriesCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        caloriesCountLabel.textAlignment = .center
        caloriesCountLabel.textColor = .white
        addSubview(caloriesCountLabel)
        
        caloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(8)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(20)
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
            make.top.equalTo(caloriesCountLabel.snp_bottomMargin).offset(6)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(30)
        }
        
        // MARK: - КАРТИНКА ЕДА
        
        let eatImage = UIImage(named: "IconEat")
        let eatImageView = UIImageView(image: eatImage)
        addSubview(eatImageView)
        
        eatImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - СЪЕДЕНО КАЛОРИЙ ЧИСЛО
        
        let eatenCaloriesCountLabel = UILabel()
        eatenCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.eatCalories)
        eatenCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        eatenCaloriesCountLabel.textAlignment = .center
        eatenCaloriesCountLabel.textColor = .white
        addSubview(eatenCaloriesCountLabel)
        
        eatenCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
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
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - КАРТИНКА ЧЕЛОВЕЧЕК
        
        let runImage = UIImage(named: "IconRun")
        let runImageView = UIImageView(image: runImage)
        addSubview(runImageView)
        
        runImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - СОЖЖЕНО КАЛОРИЙ ЧИСЛО
        
        let burnedCaloriesCountLabel = UILabel()
        burnedCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.burnedCalories)
        burnedCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        burnedCaloriesCountLabel.textAlignment = .center
        burnedCaloriesCountLabel.textColor = .white
        addSubview(burnedCaloriesCountLabel)
        
        burnedCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(runImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
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
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        let proteinLabel = UILabel()
        proteinLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinLabel.textAlignment = .center
        proteinLabel.textColor = .white
        addSubview(proteinLabel)
        
        proteinLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        let carbsLabel = UILabel()
        carbsLabel.text = NSLocalizedString("mainWidget.carbs", comment: "")
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textAlignment = .center
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.4)
        }
        
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        let fatsLabel = UILabel()
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textAlignment = .center
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.6)
        }
        
        // MARK: - ОБЩИЙ ПРОГРЕСС БАР ЧТОБЫ НАЛОЖИТЬ ОСТАЛЬНЫЕ НА НЕЕ
        
        let overallProgressBar = UIView()
        overallProgressBar.layer.cornerRadius = 2
        overallProgressBar.backgroundColor = .white.withAlphaComponent(0)
        addSubview(overallProgressBar)
        
        overallProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.trailing.equalTo(self.snp_trailingMargin).inset(16)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС БАР
        
        let carbsProgressBackground = UIView()
        carbsProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        carbsProgressBackground.layer.cornerRadius = 2
        addSubview(carbsProgressBackground)
        
        carbsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(0.3)
        }
        
        let carbsProgressBar = UIView()
        carbsProgressBar.backgroundColor = .white
        addSubview(carbsProgressBar)
        
        carbsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(carbsProgressBackground).multipliedBy(0.5)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС БАР
        
        let proteinProgressBackground = UIView()
        proteinProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        proteinProgressBackground.layer.cornerRadius = 2
        addSubview(proteinProgressBackground)
        
        proteinProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(overallProgressBar).multipliedBy(0.3)
        }
        
        let proteinProgressBar = UIView()
        proteinProgressBar.backgroundColor = .white
        addSubview(proteinProgressBar)
        
        proteinProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(proteinProgressBackground).multipliedBy(0.5)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС БАР
        
        let fatsProgressBackground = UIView()
        fatsProgressBackground.backgroundColor = .white.withAlphaComponent(0.2)
        fatsProgressBackground.layer.cornerRadius = 2
        addSubview(fatsProgressBackground)
        
        fatsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(proteinProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(overallProgressBar).multipliedBy(0.33)
        }
        
        let fatsProgressBar = UIView()
        fatsProgressBar.backgroundColor = .white
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(proteinProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(fatsProgressBackground).multipliedBy(0.5)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС ЛЕЙБЛ
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textAlignment = .center
        carbsProgressLabel.textColor = .white
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.4)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinProgressLabel.font = .systemFont(ofSize: 12)
        proteinProgressLabel.textAlignment = .center
        proteinProgressLabel.textColor = .white
        addSubview(proteinProgressLabel)
        
        proteinProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textAlignment = .center
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.6)
        }
        
    }
    
}
