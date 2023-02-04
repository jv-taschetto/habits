//
//  HabitsApp.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 04/02/23.
//

import SwiftUI

@main
struct HabitsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
