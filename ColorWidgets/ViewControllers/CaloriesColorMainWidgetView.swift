//
//  CaloriesColorMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CaloriesColorMainWidgetView: UIView, MainWidget {
    
    lazy var caloriesColorMainWidgetView: UIView = {
        let view = UIView()
//        viewAdd.backgroundColor = .green
        view.layer.cornerRadius = 25
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        set(theme: .orangeGradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(theme: ColorTheme) {
        switch theme {
        case .orangeGradient:
            let gradientView = GradientView()
//            caloriesColorMainWidgetView.layer.addSublayer(gradientView.layer)
//            caloriesColorMainWidgetView.layer.backgroundColor = gradientView.layer.backgroundColor
            caloriesColorMainWidgetView.backgroundColor = gradientView.hexColor(hex: "F8637E")
            
        case .orangeFlat:
            print("")
        case .greenGradient:
            print("")
        case .greenFlat:
            print("")
        }
    }
    
    func update() {
        print("")
    }
    
    private func setupView() {
        
        addSubview(caloriesColorMainWidgetView)
        
        // левый стэк вью
        let eatenStackView = UIStackView()
        eatenStackView.axis = .vertical
        eatenStackView.spacing = 5
        eatenStackView.alignment = .center
        
        let iconEat = UIImage(named: "IconEat")
        iconEat?.size.equalTo(CGSize(width: 11, height: 20))
        
        let eatenCaloriesCountLabel = UILabel()
        eatenCaloriesCountLabel.text = "1283"
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
            make.top.equalTo(caloriesColorMainWidgetView.snp_topMargin).inset(48)
            make.left.equalTo(caloriesColorMainWidgetView.snp_leftMargin).inset(20)
        }
        
        // круглый прогресс вью
        let circularView = CircularProgressView()
        addSubview(circularView)
        circularView.snp.makeConstraints { make in
            make.top.equalTo(caloriesColorMainWidgetView.snp_topMargin).inset(21)
            make.left.equalTo(caloriesColorMainWidgetView.snp_leftMargin).inset(105)
        }
        
        // калории лейбл внутри круга
        let caloriesLabel = UILabel()
        caloriesLabel.text = "ккал"
        caloriesLabel.font = .systemFont(ofSize: 12)
        caloriesLabel.textColor = .white
        
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(caloriesColorMainWidgetView.snp_topMargin).inset(49)
            make.left.equalTo(caloriesColorMainWidgetView.snp_leftMargin).inset(158)
        }
        
        // количество и осталось внутри круга
        let caloriesStackView = UIStackView()
        caloriesStackView.axis = .vertical
        caloriesStackView.distribution = .fillEqually
        caloriesStackView.alignment = .center
        
        let caloriesCountLabel = UILabel()
        caloriesCountLabel.text = "1265"
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
            make.left.equalTo(caloriesColorMainWidgetView.snp_leftMargin).inset(134)
            make.top.equalTo(caloriesColorMainWidgetView.snp_topMargin).inset(66)
        }
        
        // правый стэк вью
        
        let burnedCaloriesStackView = UIStackView()
        burnedCaloriesStackView.axis = .vertical
        burnedCaloriesStackView.spacing = 5
        burnedCaloriesStackView.alignment = .center
        
        let runImage = UIImage(named: "IconRun")
        runImage?.size.equalTo(CGSize(width: 11, height: 20))
        
        let burnedCaloriesCountLabel = UILabel()
        burnedCaloriesCountLabel.text = "1583"
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
            make.top.equalTo(caloriesColorMainWidgetView.snp_topMargin).inset(48)
            make.right.equalTo(caloriesColorMainWidgetView.snp_rightMargin).inset(20)
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
        carbsProgressView.progress = 0.9
        carbsProgressView.progressTintColor = .white
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "87 / 449 г"
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
        proteinProgressView.progress = 0.9
        proteinProgressView.progressTintColor = .white
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "155 / 180 г"
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
        fatsProgressView.progress = 0.9
        fatsProgressView.progressTintColor = .white
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "16 / 119 г"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .white
        fatsProgressLabel.textAlignment = .center
        
        fatsStackView.addArrangedSubview(fatsLabel)
        fatsStackView.addArrangedSubview(fatsProgressView)
        fatsStackView.addArrangedSubview(fatsProgressLabel)
        
        // общий стэк вью
        
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
            make.left.equalTo(caloriesColorMainWidgetView.snp_leftMargin).inset(16)
            make.right.equalTo(caloriesColorMainWidgetView.snp_rightMargin).inset(16)
            make.bottom.equalTo(caloriesColorMainWidgetView.snp_bottomMargin).inset(16)
        }
    }
    
}
