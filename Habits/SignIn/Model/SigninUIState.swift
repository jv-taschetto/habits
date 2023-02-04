//
//  SigninUIState.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 10/02/23.
//

import Foundation

enum SigninUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error (String)
}
