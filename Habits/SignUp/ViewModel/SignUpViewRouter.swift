//
//  SignUpViewRouter.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 15/02/23.
//

import SwiftUI


enum SignUpViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        
        return HomeView(viewModel: viewModel)
    }
}
