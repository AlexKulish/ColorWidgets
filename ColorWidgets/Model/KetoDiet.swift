//
//  KetoDiet.swift
//  ColorWidgets
//
//  Created by Alex Kulish on 05.04.2022.
//

import Foundation

struct KetoDiet {
    
    let eatCalories: Double
    let markCalories: Double
    let burnedCalories: Double
    
    let eatCarbs, eatProteins, eatFats: Double
    let markCarbs, markProteins, markFats: Double
    
    static func getDiet() -> KetoDiet {
        
        KetoDiet(eatCalories: 1250,
                 markCalories: 1750,
                 burnedCalories: 1550,
                 eatCarbs: 150,
                 eatProteins: 100,
                 eatFats: 90,
                 markCarbs: 480,
                 markProteins: 150,
                 markFats: 120)
        
    }
}
