//
//  UserSettings.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    
    @Published var addMinNumber: Double = 0
    @Published var addMaxNumber: Double = 10
    
}
