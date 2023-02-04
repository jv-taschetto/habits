//
//  Gender.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 15/02/23.
//

import Foundation


enum Gender: String, CaseIterable ,Identifiable{
    case male = "Masculino"
    case female = "Feminino"
    
    var id: String {
        self.rawValue
    }
}
