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
