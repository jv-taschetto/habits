//
//  SignInViewModel.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 06/02/23.
//

import SwiftUI
import Combine
class SignInViewModel:ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    private var cancellable: AnyCancellable?
    private   let publisher = PassthroughSubject<Bool, Never>()
    
    
    
    @Published var uiState: SigninUIState = .none
    init(){
        cancellable = publisher.sink {   value in
            print("usuario criado! goToHome: \(value)")
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit{
        cancellable?.cancel()
    }
    
    func login(){
        self.uiState = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .goToHomeScreen
        }
        
    }
    
}


extension SignInViewModel{
    func homeView() -> some View{
        return SignInViewRouter.makeHomeView()
    }
    func signUpView() -> some View {
        return SignInViewRouter .makeSignUpView(publisher: publisher )
    }
}
