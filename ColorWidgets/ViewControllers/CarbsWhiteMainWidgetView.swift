//
//  CarbsWhiteMainWidgetView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit
import SnapKit

class CarbsWhiteMainWidgetView: GradientView, MainWidget {
    
    var ketoDiet = KetoDiet.getDiet()
    
    private var circularView: CircularProgressView! // ! для пробы
    
//    let circularView = CircularProgressView(progressColor: .red, circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
    
    
    private let proteinLabel = UILabel()
    private let proteinProgressLabel = UILabel()
    private let proteinProgressBackground = UIView()
    private let proteinProgressBar = UIView()
    
    private let fatsLabel = UILabel()
    private let fatsProgressLabel = UILabel()
    private let fatsProgressBackground = UIView()
    private let fatsProgressBar = UIView()
    
    private let caloriesLabel = UILabel()
    private let caloriesProgressLabel = UILabel()
    private let caloriesProgressBackground = UIView()
    private let caloriesProgressBar = UIView()
    
    private let carbsCountLabel = UILabel()
    private let carbsLeftLabel = UILabel()
    
    private let caloriesInPercentLabel = UILabel()
    private let overallProgressBar = UIView()
    private let carbsProgressBarInPercent = UIView()
    private let fatsProgressBarInPercent = UIView()
    private let proteinProgressBarInPercent = UIView()
    private let carbsInPercentLabel = UILabel()
    private let fatsInPercentLabel = UILabel()
    private let proteinsInPercentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circularView = CircularProgressView(progressColor: setProgressColor("FB825B"), circleColor: .gray.withAlphaComponent(0.2), isClosed: false, radius: 66)
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
        
        circularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs))
        
        carbsCountLabel.text = "\(String(format: "%.0f", setCarbsRemained(valueOne: ketoDiet.markCarbs, valueTwo: ketoDiet.eatCarbs)))"
        
        carbsLeftLabel.text = """
                                \(NSLocalizedString("mainWidget.remainedSmall", comment: ""))
                                \(NSLocalizedString("mainWidget.from", comment: "")) \(String(format: "%.0f", ketoDiet.markCarbs)) \(NSLocalizedString("mainWidget.g", comment: ""))
                                """
        
        
        
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        
        caloriesProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCalories)) / \(String(format: "%.0f", ketoDiet.markCalories)) \(NSLocalizedString("mainWidget.kcal", comment: ""))"
        
        carbsInPercentLabel.text = "\(getPercent(value: ketoDiet.markCarbs / getSumOfPFC())) \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        
        fatsInPercentLabel.text = "\(getPercent(value: ketoDiet.markFats / getSumOfPFC())) \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        
        proteinsInPercentLabel.text = "\(getPercent(value: ketoDiet.markProteins / getSumOfPFC())) \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        
        proteinProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinProgressBackground).multipliedBy(setProgressBar(valueOne: ketoDiet.eatProteins, valueTwo: ketoDiet.markProteins))
        }
        
        fatsProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(fatsProgressBackground).multipliedBy(setProgressBar(valueOne: ketoDiet.eatFats, valueTwo: ketoDiet.markFats))
            
        }
        
        caloriesProgressBar.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(caloriesProgressBackground).multipliedBy(setProgressBar(valueOne: ketoDiet.eatCalories, valueTwo: ketoDiet.markCalories))
            
        }
        
        carbsProgressBarInPercent.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markCarbs / getSumOfPFC())
        }
        
        fatsProgressBarInPercent.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markFats / getSumOfPFC())
        }
        
        proteinProgressBarInPercent.snp.remakeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markProteins / getSumOfPFC())
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                    self.layoutIfNeeded()
                }
        
    }
    
    func drawLinearGradient(inside path:UIBezierPath, start:CGPoint, end:CGPoint, colors:[UIColor]) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        ctx.saveGState()
        defer { ctx.restoreGState() } // clean up graphics state changes when the method returns

        path.addClip() // use the path as the clipping region

        let cgColors = colors.map({ $0.cgColor })
        guard let gradient = CGGradient(colorsSpace: nil, colors: cgColors as CFArray, locations: nil)
            else { return }

        ctx.drawLinearGradient(gradient, start: start, end: end, options: [])
    }
    
//    private func getGradient() {
//
//        let gradient = CAGradientLayer()
//        gradient.frame = circularView.bounds
//        gradient.colors = [UIColor.magenta.cgColor, UIColor.cyan.cgColor]
//
//        let shapeMask = CAShapeLayer()
//        shapeMask.path = path.cgPath
//
//        gradient.mask = shapeMask
//        circularView.layer.addSublayer(gradient)
//
//    }
    
    private func getPercent(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 2
        formatter.maximumFractionDigits = 1
        
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

    
    private func setupView() {
        
        // MARK: - КРУГЛЫЙ ПРОГРЕСС БАР
        
        circularView.progressAnimation(duration: 5, value: setProgressBar(valueOne: ketoDiet.eatCarbs, valueTwo: ketoDiet.markCarbs))
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
        
        carbsCountLabel.text = "\(String(format: "%.0f", setCarbsRemained(valueOne: ketoDiet.markCarbs, valueTwo: ketoDiet.eatCarbs)))"
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
        
        proteinLabel.text = NSLocalizedString("mainWidget.proteins", comment: "")
        proteinLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        proteinLabel.textColor = .black
        addSubview(proteinLabel)
        
        proteinLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(26)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - ЖИРЫ ЛЕЙБЛ
        
        fatsLabel.text = NSLocalizedString("mainWidget.fats", comment: "")
        fatsLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        fatsLabel.textColor = .black
        addSubview(fatsLabel)
        
        fatsLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - КАЛОРИИ ЛЕЙБЛ
        
        caloriesLabel.text = NSLocalizedString("mainWidget.calories", comment: "")
        caloriesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesLabel.textColor = .black
        addSubview(caloriesLabel)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(40)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС ЛЕЙБЛ
        
        proteinProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatProteins)) / \(String(format: "%.0f", ketoDiet.markProteins)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        proteinProgressLabel.font = .systemFont(ofSize: 12)
        proteinProgressLabel.textColor = .black
        addSubview(proteinProgressLabel)
        
        proteinProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin).inset(26)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС ЛЕЙБЛ
        
        fatsProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatFats)) / \(String(format: "%.0f", ketoDiet.markFats)) \(NSLocalizedString("mainWidget.g", comment: ""))"
        fatsProgressLabel.font = .systemFont(ofSize: 12)
        fatsProgressLabel.textColor = .black
        addSubview(fatsProgressLabel)
        
        fatsProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - КАЛОРИИ ПРОГРЕСС ЛЕЙБЛ
        
        caloriesProgressLabel.text = "\(String(format: "%.0f", ketoDiet.eatCalories)) / \(String(format: "%.0f", ketoDiet.markCalories)) \(NSLocalizedString("mainWidget.kcal", comment: ""))"
        caloriesProgressLabel.font = .systemFont(ofSize: 12)
        caloriesProgressLabel.textColor = .black
        addSubview(caloriesProgressLabel)
        
        caloriesProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(fatsProgressLabel.snp_bottomMargin).offset(40)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        // MARK: - БЕЛКИ ПРОГРЕСС БАР
        
        proteinProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        proteinProgressBackground.layer.cornerRadius = 2
        addSubview(proteinProgressBackground)
        
        proteinProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        proteinProgressBar.backgroundColor = hexColor(hex: "FDBE7D")
        proteinProgressBar.layer.cornerRadius = 2
        addSubview(proteinProgressBar)
        
        proteinProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(proteinLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(proteinProgressBackground).multipliedBy(setProgressBar(valueOne: ketoDiet.eatProteins, valueTwo: ketoDiet.markProteins))
            
        }
        
        // MARK: - ЖИРЫ ПРОГРЕСС БАР
        
        fatsProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        fatsProgressBackground.layer.cornerRadius = 2
        addSubview(fatsProgressBackground)
        
        fatsProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        fatsProgressBar.backgroundColor = hexColor(hex: "B5B3DC")
        fatsProgressBar.layer.cornerRadius = 2
        addSubview(fatsProgressBar)
        
        fatsProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(fatsLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(fatsProgressBackground).multipliedBy(setProgressBar(valueOne: ketoDiet.eatFats, valueTwo: ketoDiet.markFats))
            
        }
        
        // MARK: - КАЛОРИИ ПРОГРЕСС БАР
        
        caloriesProgressBackground.backgroundColor = .gray.withAlphaComponent(0.2)
        caloriesProgressBackground.layer.cornerRadius = 2
        addSubview(caloriesProgressBackground)
        
        caloriesProgressBackground.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.trailing.equalTo(self.snp_trailingMargin).inset(10)
        }
        
        caloriesProgressBar.backgroundColor = hexColor(hex: "F79498")
        caloriesProgressBar.layer.cornerRadius = 2
        addSubview(caloriesProgressBar)
        
        caloriesProgressBar.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(circularView.snp_leadingMargin).inset(140)
            make.width.equalTo(caloriesProgressBackground).multipliedBy(setProgressBar(valueOne: ketoDiet.eatCalories, valueTwo: ketoDiet.markCalories))
            
        }
        
        // MARK: - КАЛОРИИ В ПРОЦЕНТАХ
        
        caloriesInPercentLabel.text = NSLocalizedString("mainWidget.сomposition", comment: "")
        caloriesInPercentLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        caloriesInPercentLabel.textColor = .black
        addSubview(caloriesInPercentLabel)
        
        caloriesInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsLeftLabel.snp_bottomMargin).offset(23)
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
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        carbsProgressBarInPercent.layer.cornerRadius = 2
        carbsProgressBarInPercent.backgroundColor = hexColor(hex: "F9440B")
        addSubview(carbsProgressBarInPercent)
        
        carbsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markCarbs / getSumOfPFC())
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        fatsProgressBarInPercent.layer.cornerRadius = 2
        fatsProgressBarInPercent.backgroundColor = hexColor(hex: "91D0B6")
        addSubview(fatsProgressBarInPercent)
        
        fatsProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(carbsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markFats / getSumOfPFC())
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ПРОГРЕСС БАР
        
        proteinProgressBarInPercent.layer.cornerRadius = 2
        proteinProgressBarInPercent.backgroundColor = hexColor(hex: "91D0B6")
        addSubview(proteinProgressBarInPercent)
        
        proteinProgressBarInPercent.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.top.equalTo(caloriesInPercentLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(fatsProgressBarInPercent.snp_trailingMargin).offset(14)
            make.width.equalTo(overallProgressBar).multipliedBy(ketoDiet.markProteins / getSumOfPFC())
        }
        
        // MARK: - УГЛЕВОДЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        carbsInPercentLabel.text = "\(getPercent(value: ketoDiet.markCarbs / getSumOfPFC())) \(NSLocalizedString("mainWidget.carbsSmall", comment: ""))"
        carbsInPercentLabel.font = .systemFont(ofSize: 12)
        carbsInPercentLabel.textColor = .black
        addSubview(carbsInPercentLabel)
        
        carbsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.leading.equalTo(self.snp_leadingMargin).inset(16)
        }
        
        // MARK: - ЖИРЫ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        fatsInPercentLabel.text = "\(getPercent(value: ketoDiet.markFats / getSumOfPFC())) \(NSLocalizedString("mainWidget.fatsSmall", comment: ""))"
        fatsInPercentLabel.font = .systemFont(ofSize: 12)
        fatsInPercentLabel.textColor = .black
        addSubview(fatsInPercentLabel)
        
        fatsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // MARK: - БЕЛКИ В ПРОЦЕНТАХ ЛЕЙБЛ
        
        proteinsInPercentLabel.text = "\(getPercent(value: ketoDiet.markProteins / getSumOfPFC())) \(NSLocalizedString("mainWidget.proteinsSmall", comment: ""))"
        proteinsInPercentLabel.font = .systemFont(ofSize: 12)
        proteinsInPercentLabel.textColor = .black
        addSubview(proteinsInPercentLabel)
        
        proteinsInPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(carbsProgressBarInPercent.snp_bottomMargin).offset(12)
            make.centerX.equalTo(self.snp.centerX).multipliedBy(1.65)
        }
        
        
    }
    
    
    
}
