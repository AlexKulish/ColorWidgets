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
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        createCircularPath()
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
    
    public func progressAnimation(duration: TimeInterval, value: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
