//
//  CaloriesWhiteMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CaloriesWhiteMainWidgetView: GradientView, MainWidget {
    
    let ketoDiet = KetoDiet.getDiet()
    
    private var circularView: CircularProgressView! // ! для пробы
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.circularView = CircularProgressView(progressColor: setProgressColor("FCAD80"), circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
        set(theme: .orangeGradient)
        set(cornerRadius: 25)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setProgressColor(_ hexOne: String) -> UIColor {
        hexColor(hex: hexOne)
    }
    
    func set(theme: ColorTheme) {
        switch theme {
        case .orangeGradient:
            circularView = CircularProgressView(progressColor: setProgressColor("FCAD80"), circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
//            set(colors: [hexColor(hex: "FCAD80").cgColor,
//                         hexColor(hex: "F8637E").cgColor])
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
        print("")
    }
    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ЦЕНТРАЛЬНЫЙ ПРОГРЕСС БАР
        
//        let circularView = CircularProgressView(progressColor: .white, circleColor: .white.withAlphaComponent(0.2), isClosed: false, radius: 66)
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
        caloriesLabel.text = "ккал"
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textColor = .black
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(circularView.snp_topMargin).inset(22)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(44)
        }
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ ЧИСЛО ВНУТРИ КРУГА
        
        let caloriesCountLabel = UILabel()
        caloriesCountLabel.text = String(format: "%.0f", ketoDiet.markCalories)
        caloriesCountLabel.font = .systemFont(ofSize: 32, weight: .bold)
        caloriesCountLabel.textAlignment = .center
        caloriesCountLabel.textColor = .black
        addSubview(caloriesCountLabel)
        
        caloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(8)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(20)
        }
        
        // MARK: - КАЛОРИИ ОСТАЛОСЬ СЛОВО ВНУТРИ КРУГА
        
        let caloriesLeftLabel = UILabel()
        caloriesLeftLabel.text = "Осталось"
        caloriesLeftLabel.font = .systemFont(ofSize: 12)
        caloriesLeftLabel.textAlignment = .center
        caloriesLeftLabel.textColor = .black
        addSubview(caloriesLeftLabel)
        
        caloriesLeftLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(caloriesCountLabel.snp_bottomMargin).offset(6)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(30)
        }
        
        // MARK: - КАРТИНКА ЕДА
        
        let eatImage = UIImage(named: "IconEatBlack")
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
        eatenCaloriesCountLabel.textColor = .black
        addSubview(eatenCaloriesCountLabel)
        
        eatenCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - СЪЕДЕНО КАЛОРИЙ СЛОВО
        
        let eatenLabel = UILabel()
        eatenLabel.text = "Съедено"
        eatenLabel.font = .systemFont(ofSize: 12)
        eatenLabel.textAlignment = .center
        eatenLabel.textColor = .black
        addSubview(eatenLabel)
        
        eatenLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(eatenCaloriesCountLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.35)
        }
        
        // MARK: - КАРТИНКА ЧЕЛОВЕЧЕК
        
        let runImage = UIImage(named: "IconRunBlack")
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
        burnedCaloriesCountLabel.textColor = .black
        addSubview(burnedCaloriesCountLabel)
        
        burnedCaloriesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(runImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - СОЖЖЕНО КАЛОРИЙ СЛОВО
        
        let burnedLabel = UILabel()
        burnedLabel.text = "Сожжено"
        burnedLabel.font = .systemFont(ofSize: 12)
        burnedLabel.textAlignment = .center
        burnedLabel.textColor = .black
        addSubview(burnedLabel)
        
        burnedLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(burnedCaloriesCountLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        // MARK: - БЕЛКИ ЛЕЙБЛ
        
        let proteinLabel = UILabel()
        proteinLabel.text = "Белки"
        proteinLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinLabel.textAlignment = .center
        proteinLabel.textColor = .black
        addSubview(proteinLabel)
        
        proteinLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.top.equalTo(circularView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - УГЛЕВОДЫ ЛЕЙБЛ
        
        let carbsLabel = UILabel()
        carbsLabel.text = "Углеводы"
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
        
        let fatsLabel = UILabel()
        fatsLabel.text = "Жиры"
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
        carbsProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        carbsProgressBackground.layer.cornerRadius = 2
        addSubview(carbsProgressBackground)
        
        carbsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(0.3)
        }
        
        let carbsProgressBar = UIView()
        carbsProgressBar.backgroundColor = hexColor(hex: "F79498")
        addSubview(carbsProgressBar)
        
        carbsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(carbsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(carbsProgressBackground).multipliedBy(0.5)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС БАР
        
        let proteinProgressBackground = UIView()
        proteinProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        proteinProgressBackground.layer.cornerRadius = 2
        addSubview(proteinProgressBackground)
        
        proteinProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(overallProgressBar).multipliedBy(0.3)
        }
        
        let proteinProgressBar = UIView()
        proteinProgressBar.backgroundColor = hexColor(hex: "FDBE7D")
        addSubview(proteinProgressBar)
        
        proteinProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBackground.snp_trailingMargin).offset(23)
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
            make.leading.equalTo(proteinProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(overallProgressBar).multipliedBy(0.33)
        }
        
        let fatsProgressBar = UIView()
        fatsProgressBar.backgroundColor = hexColor(hex: "B5B3DC")
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(proteinProgressBackground.snp_trailingMargin).offset(23)
            make.width.equalTo(fatsProgressBackground).multipliedBy(0.5)
        }
        
        // MARK: - УГЛЕВОДЫ ПРОГРЕСС ЛЕЙБЛ
        
        let carbsProgressLabel = UILabel()
        carbsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCarbs)) / \(String(format: "%.0f", ketoDiet.markCarbs)) г"
        carbsProgressLabel.font = .systemFont(ofSize: 12)
        carbsProgressLabel.textAlignment = .center
        carbsProgressLabel.textColor = .black
        addSubview(carbsProgressLabel)
        
        carbsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(0.4)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        let proteinProgressLabel = UILabel()
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) г"
        proteinProgressLabel.font = .systemFont(ofSize: 12)
        proteinProgressLabel.textAlignment = .center
        proteinProgressLabel.textColor = .black
        addSubview(proteinProgressLabel)
        
        proteinProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        let fatsProgressLabel = UILabel()
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) г"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textAlignment = .center
        fatsProgressLabel.textColor = .black
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.top.equalTo(carbsProgressBackground.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.6)
        }
        
    }
    
    
}
