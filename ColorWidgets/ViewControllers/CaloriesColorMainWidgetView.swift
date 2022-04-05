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
        
        // левый стэк вью
    
        let eatenStackView = UIStackView()
        eatenStackView.axis = .vertical
        eatenStackView.spacing = 5
        eatenStackView.alignment = .center

        let iconEat = UIImage(named: "IconEat")
        iconEat?.size.equalTo(CGSize(width: 11, height: 20))

        let eatenCaloriesCountLabel = UILabel()
        eatenCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.eatCalories)
        eatenCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        eatenCaloriesCountLabel.textColor = .white
        let eatenLabel = UILabel()
        eatenLabel.text = "Съедено"
        eatenLabel.font = .systemFont(ofSize: 12)
        eatenLabel.textColor = .white

        eatenStackView.addArrangedSubview(UIImageView(image: iconEat))
        eatenStackView.addArrangedSubview(eatenCaloriesCountLabel)
        eatenStackView.addArrangedSubview(eatenLabel)

        addSubview(eatenStackView)

        eatenStackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.left.equalTo(self.snp_leftMargin).inset(20)
        }
        
        // круглый прогресс вью
        
        let circularView = CircularProgressView(progressColor: .white, circleColor: .white.withAlphaComponent(0.2), isClosed: false, radius: 66)
        circularView.progressAnimation(duration: 5, value: 1)
        addSubview(circularView)
        circularView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(21)
            make.left.greaterThanOrEqualTo(self.snp_leftMargin).inset(105) // было 105 на 13 айфоне все ок
        }
        
        // калории лейбл внутри круга
        
        let caloriesLabel = UILabel()
        caloriesLabel.text = "ккал"
        caloriesLabel.font = .systemFont(ofSize: 12)
        caloriesLabel.textColor = .white
        
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(49)
            make.left.equalTo(self.snp_leftMargin).inset(158)
        }
        
        // количество и осталось внутри круга
        
        let caloriesStackView = UIStackView()
        caloriesStackView.axis = .vertical
        caloriesStackView.distribution = .fillEqually
        caloriesStackView.alignment = .center
        
        let caloriesCountLabel = UILabel()
        caloriesCountLabel.text = String(format: "%.0f", ketoDiet.markCalories)
        caloriesCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        caloriesCountLabel.textColor = .white
        let caloriesLeftLabel = UILabel()
        caloriesLeftLabel.text = "Осталось"
        caloriesLeftLabel.font = .systemFont(ofSize: 12)
        caloriesLeftLabel.textColor = .white
        
        caloriesStackView.addArrangedSubview(caloriesCountLabel)
        caloriesStackView.addArrangedSubview(caloriesLeftLabel)
        
        addSubview(caloriesStackView)

        caloriesStackView.snp.makeConstraints { make in
            make.left.equalTo(self.snp_leftMargin).inset(134)
            make.top.equalTo(self.snp_topMargin).inset(66)
        }
        
        // правый стэк вью
        
        let burnedCaloriesStackView = UIStackView()
        burnedCaloriesStackView.axis = .vertical
        burnedCaloriesStackView.spacing = 5
        burnedCaloriesStackView.alignment = .center
        
        let runImage = UIImage(named: "IconRun")
        runImage?.size.equalTo(CGSize(width: 11, height: 20))
        
        let burnedCaloriesCountLabel = UILabel()
        burnedCaloriesCountLabel.text = String(format: "%.0f", ketoDiet.burnedCalories)
        burnedCaloriesCountLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        burnedCaloriesCountLabel.textColor = .white
        let burnedLabel = UILabel()
        burnedLabel.text = "Сожжено"
        burnedLabel.font = .systemFont(ofSize: 12)
        burnedLabel.textColor = .white
        
        burnedCaloriesStackView.addArrangedSubview(UIImageView(image: runImage))
        burnedCaloriesStackView.addArrangedSubview(burnedCaloriesCountLabel)
        burnedCaloriesStackView.addArrangedSubview(burnedLabel)
        
        addSubview(burnedCaloriesStackView)
        
        burnedCaloriesStackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(48)
            make.right.equalTo(self.snp_rightMargin).inset(20)
        }
        
        // углеводы стэк вью
        
        let carbsStackView = UIStackView()
        carbsStackView.axis = .vertical
        carbsStackView.spacing = 7
        
        let carbsLabel = UILabel()
        carbsLabel.text = "Углеводы"
        carbsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        carbsLabel.textColor = .white
        carbsLabel.textAlignment = .center
        
        let carbsProgressView = UIProgressView()
        carbsProgressView.progress = Float(ketoDiet.eatCarbs / ketoDiet.markCarbs)
        carbsProgressView.progressTintColor = .white
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) г"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textColor = .white
        carbsProgressLabel.textAlignment = .center
        
        carbsStackView.addArrangedSubview(carbsLabel)
        carbsStackView.addArrangedSubview(carbsProgressView)
        carbsStackView.addArrangedSubview(carbsProgressLabel)
        
        
        // белки стэк вью
        
        let proteinStackView = UIStackView()
        proteinStackView.axis = .vertical
        proteinStackView.spacing = 7
        
        let proteinLabel = UILabel()
        proteinLabel.text = "Белки"
        proteinLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinLabel.textColor = .white
        proteinLabel.textAlignment = .center
        
        let proteinProgressView = UIProgressView()
        proteinProgressView.progress = Float(ketoDiet.eatProteins / ketoDiet.markProteins)
        proteinProgressView.progressTintColor = .white
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) г"
        proteinProgressLabel.font = .systemFont(ofSize: 12)
        proteinProgressLabel.textColor = .white
        proteinProgressLabel.textAlignment = .center
        
        proteinStackView.addArrangedSubview(proteinLabel)
        proteinStackView.addArrangedSubview(proteinProgressView)
        proteinStackView.addArrangedSubview(proteinProgressLabel)
        
        // жиры стэк вью
        
        let fatsStackView = UIStackView()
        fatsStackView.axis = .vertical
        fatsStackView.spacing = 7
        
        let fatsLabel = UILabel()
        fatsLabel.text = "Жиры"
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .white
        fatsLabel.textAlignment = .center
        
        let fatsProgressView = UIProgressView()
        fatsProgressView.progress = Float(ketoDiet.eatFats / ketoDiet.markFats)
        fatsProgressView.progressTintColor = .white
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) г"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        fatsProgressLabel.textAlignment = .center
        
        fatsStackView.addArrangedSubview(fatsLabel)
        fatsStackView.addArrangedSubview(fatsProgressView)
        fatsStackView.addArrangedSubview(fatsProgressLabel)
        
        // общий стэк вью нижний
        
        let overallStackView = UIStackView()
        overallStackView.axis = .horizontal
        overallStackView.spacing = 25
        overallStackView.distribution = .fillEqually
        
        overallStackView.addArrangedSubview(carbsStackView)
        overallStackView.addArrangedSubview(proteinStackView)
        overallStackView.addArrangedSubview(fatsStackView)
        
        addSubview(overallStackView)
        
        overallStackView.snp.makeConstraints { make in
            make.top.equalTo(caloriesLeftLabel.snp_topMargin).inset(39)
            make.left.equalTo(self.snp_leftMargin).inset(16)
            make.right.equalTo(self.snp_rightMargin).inset(16)
            make.bottom.equalTo(self.snp_bottomMargin).inset(16)
        }
    }
    
}
