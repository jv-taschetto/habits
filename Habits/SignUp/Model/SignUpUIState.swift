//
//  SignUpUIState.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 15/02/23.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
