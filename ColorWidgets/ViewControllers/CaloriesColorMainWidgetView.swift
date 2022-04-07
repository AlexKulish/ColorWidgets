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
        
        // круглый прогресс бар
        
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
        
        // калории лейбл внутри круга
        
        let caloriesLabel = UILabel()
        caloriesLabel.text = "ккал"
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textColor = .white
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(circularView.snp_topMargin).inset(22)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(44)
        }
        
        // калории осталось число внутри круга
        
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
        
        // калории осталось слово внутри круга
        
        let caloriesLeftLabel = UILabel()
        caloriesLeftLabel.text = "Осталось"
        caloriesLeftLabel.font = .systemFont(ofSize: 12)
        caloriesLeftLabel.textAlignment = .center
        caloriesLeftLabel.textColor = .white
        addSubview(caloriesLeftLabel)
        
        caloriesLeftLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(caloriesCountLabel.snp_bottomMargin).offset(6)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(30)
        }
        
        // картинка еда
        
        let eatImage = UIImage(named: "IconEat")
//        eatImage?.size.equalTo(CGSize(width: 11, height: 20))
        let eatImageView = UIImageView(image: eatImage)
        addSubview(eatImageView)
        
        eatImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(22)
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.leading.equalTo(self.snp_leadingMargin).inset(34)
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
            make.leading.equalTo(self.snp_leadingMargin).inset(20)
            make.trailing.lessThanOrEqualTo(circularView.snp_leadingMargin).inset(-26)
            
//            make.leading.greaterThanOrEqualTo(self.snp_leadingMargin).inset(20)
//            make.trailing.equalTo(circularView.snp_leadingMargin).inset(-26)
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
            make.leading.equalTo(eatenCaloriesCountLabel.snp_leadingMargin).inset(-7)
        }
        
        // картинка человечек
        
        let runImage = UIImage(named: "IconRun")
//        runImage?.size.equalTo(CGSize(width: 11, height: 20))
        let runImageView = UIImageView(image: runImage)
        addSubview(runImageView)
        
        runImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(22)
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.trailing.equalTo(self.snp_trailingMargin).inset(34)
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
            make.leading.greaterThanOrEqualTo(circularView.snp_trailingMargin).inset(26)
            make.trailing.equalTo(self.snp_trailingMargin).inset(20)
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
            make.leading.equalTo(burnedCaloriesCountLabel.snp_leadingMargin).inset(-7)
        }
        
        // белки лейбл
        
        let proteinLabel = UILabel()
        proteinLabel.text = "Белки"
        proteinLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinLabel.textAlignment = .center
        proteinLabel.textColor = .white
        addSubview(proteinLabel)
        
        proteinLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.leading.equalTo(caloriesLeftLabel.snp_leadingMargin).inset(-14)
//            make.leading.equalTo(circularView.snp_leadingMargin).inset(26)
        }
        
        // углеводы лейбл
        
        let carbsLabel = UILabel()
        carbsLabel.text = "Углеводы"
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textAlignment = .center
        carbsLabel.textColor = .white
        addSubview(carbsLabel)
        
        carbsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.leading.equalTo(eatenLabel.snp_leadingMargin)
        }
        
        
        // жиры лейбл
        
        let fatsLabel = UILabel()
        fatsLabel.text = "Жиры"
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textAlignment = .center
        fatsLabel.textColor = .white
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.leading.equalTo(circularView.snp_trailingMargin).offset(23)
        }
        
        // общий прогресс бар чтобы наложить остальные
        
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
        
        // углеводы прогресс вью
        
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
        
        // белки прогресс вью
        
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
        
        // жиры прогресс вью
        
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
        
        // углеводы прогресс лейбл
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) г"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textAlignment = .center
        carbsProgressLabel.textColor = .white
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.leading.equalTo(eatenLabel.snp_leadingMargin)

//            make.leading.equalTo(carbsLabel.snp_leadingMargin).inset(-4)
        }
        
        // белки прогресс лейбл
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) г"
        proteinProgressLabel.font = .systemFont(ofSize: 12)
        proteinProgressLabel.textAlignment = .center
        proteinProgressLabel.textColor = .white
        addSubview(proteinProgressLabel)
        
        proteinProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.leading.equalTo(caloriesLeftLabel.snp_leadingMargin).inset(-14)
        }
        
        // жиры прогресс лейбл
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) г"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textAlignment = .center
        fatsProgressLabel.textColor = .white
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_trailingMargin).offset(23)
        }
        
    }
    
}
