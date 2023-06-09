//
//  SignUpViewModel.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 15/02/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUpUIState = .none
    
    func signUp(){
        self.uiState = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .success
            self.publisher.send(true)
        }
    }
    
}

extension SignUpViewModel {
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
}
