//
//  GradientView.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 04.04.2022.
//

import UIKit

class GradientView: UIView {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [hexColor(hex: "FFFFFF").cgColor,
                           hexColor(hex: "FFFFFF").cgColor]
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.insertSublayer(layer, at: 0)
        return layer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    func set(points: (start: CGPoint, end: CGPoint)) {
        gradientLayer.startPoint = points.start
        gradientLayer.endPoint = points.end
    }
    
    func set(colors: [CGColor]) {
        gradientLayer.colors = colors
    }
    
    func set(cornerRadius: CGFloat) {
        gradientLayer.cornerRadius = cornerRadius
    }
    
    func set(distribution: [NSNumber]) {
        gradientLayer.locations = distribution
    }
    
    func hexColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) { return UIColor.systemGray }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}


