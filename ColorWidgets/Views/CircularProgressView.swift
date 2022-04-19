//
//  CircularProgressView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit

class CircularProgressView: UIView {
    
    public var radius: CGFloat = 66
    
    private var isClosed = false
    
    private var customProgressColor: UIColor?
    private var customCircleColor: UIColor?
    
    private var lineWidth: CGFloat?
    private var progressWidth: CGFloat?
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var gradient = CAGradientLayer()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        createCircularPath()
    }
    
    public convenience init(firstColor: UIColor, secondColor: UIColor) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        createGradientCircularPath(firstColor: firstColor, secondColor: secondColor)
    }
    
    public convenience init(progressColor: UIColor, circleColor: UIColor, isClosed: Bool, radius: CGFloat, lineWidth: CGFloat = 3, progressWidth: CGFloat = 6) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        customProgressColor = progressColor
        customCircleColor = circleColor
        
        self.isClosed = isClosed
        self.radius = radius
        self.lineWidth = lineWidth
        self.progressWidth = progressWidth
        
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func createCircularPath() {
        var circularPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius,
                                        startAngle: 2.5 * -.pi / 2,
                                        endAngle: .pi / 3.5,
                                        clockwise: true)
        
        if isClosed {
            circularPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius,
                                        startAngle: -.pi / 2,
                                        endAngle: .pi * 1.5,
                                        clockwise: true)
        }
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = lineWidth ?? 10
        circleLayer.strokeColor = customCircleColor == nil ? UIColor.white.withAlphaComponent(0.3).cgColor : customCircleColor?.cgColor
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = progressWidth ?? 10
        progressLayer.strokeEnd = 0.0
        
        progressLayer.strokeColor = customProgressColor == nil ? UIColor.white.cgColor : customProgressColor!.cgColor
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressLayer)
    }
    
    public func createGradientCircularPath(firstColor: UIColor, secondColor: UIColor) {
        
        var circularPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius - 5.55,
                                        startAngle: 2.5 * -.pi / 2,
                                        endAngle: .pi / 3.5,
                                        clockwise: true)
        
        if isClosed {
            circularPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius - 5.55,
                                        startAngle: -.pi / 2,
                                        endAngle: .pi * 1.5,
                                        clockwise: true)
        }
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = lineWidth ?? 3
        circleLayer.strokeColor = customCircleColor == nil ? UIColor.gray.withAlphaComponent(0.3).cgColor : customCircleColor?.cgColor
        
        gradient.frame = CGRect(x: 0, y: 0, width: circularPath.cgPath.boundingBox.size.width, height: circularPath.cgPath.boundingBox.size.height + 10)
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = progressWidth ?? 6
        progressLayer.strokeEnd = 0.0
        progressLayer.strokeColor = UIColor.white.cgColor
        gradient.mask = progressLayer
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(gradient)
        
    }
    
    public func progressAnimation(duration: TimeInterval, value: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
    
    public func progressAndColorAnimation(duration: TimeInterval, value: Double, greenColor: UIColor, yellowColor: UIColor, redColor: UIColor) {
        
        if value >= 0.75 && value < 0.95 {
            setupColorAnimation(duration: duration, value: value, color: yellowColor)
        } else if value >= 0.95 {
            setupColorAnimation(duration: duration, value: value, color: redColor)
        } else {
            setupColorAnimation(duration: duration, value: value, color: greenColor)
        }
    }
    
    private func setupColorAnimation(duration: TimeInterval, value: Double, color: UIColor) {
        
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.fromValue = 0.0
        circularProgressAnimation.toValue = value
        
        let circularColorAnimation = CABasicAnimation(keyPath: "strokeColor")
        circularColorAnimation.toValue = color.cgColor
        circularColorAnimation.duration = duration
        
        let progressAndColorAnimation = CAAnimationGroup()
        progressAndColorAnimation.animations = [circularProgressAnimation, circularColorAnimation]
        progressAndColorAnimation.duration = duration
        progressAndColorAnimation.fillMode = .forwards
        progressAndColorAnimation.isRemovedOnCompletion = false
        
        progressLayer.add(progressAndColorAnimation, forKey: "strokeEndAndColor")
        
    }
    
}
