//
//  SplashViewRouter.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 06/02/23.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View{
      let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
        
    }
}

