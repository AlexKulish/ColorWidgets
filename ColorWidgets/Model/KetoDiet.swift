//
//  KetoDiet.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 05.04.2022.
//

import Foundation

class KetoDiet {
    
    var eatCalories: Double
    var markCalories: Double
    var burnedCalories: Double
    
    var eatCarbs, eatProteins, eatFats: Double
    var markCarbs, markProteins, markFats: Double
    
    init(eatCalories: Double, markCalories: Double, burnedCalories: Double,
         eatCarbs: Double, eatProteins: Double, eatFats: Double,
         markCarbs: Double, markProteins: Double, markFats: Double) {
        self.eatCalories = eatCalories
        self.markCalories = markCalories
        self.burnedCalories = burnedCalories
        self.eatCarbs = eatCarbs
        self.eatProteins = eatProteins
        self.eatFats = eatFats
        self.markCarbs = markCarbs
        self.markProteins = markProteins
        self.markFats = markFats
    }
    
    static func getDiet() -> KetoDiet {
        
        KetoDiet(eatCalories: 950,
                 markCalories: 1750,
                 burnedCalories: 1550,
                 eatCarbs: 15,
                 eatProteins: 3,
                 eatFats: 140,
                 markCarbs: 80,
                 markProteins: 61,
                 markFats: 145)
        
    }
}
