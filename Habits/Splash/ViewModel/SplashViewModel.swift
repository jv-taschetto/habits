//
//  SplashViewModel.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 06/02/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        //Faz algo assincrono e muda o estado da uiState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            //Aqui é chamado depois de 2 segundo
            // self.uiState = .error("erro na resposta do servidor")
            self.uiState = .goToSignInScreen
        }
        
    }
}
    extension SplashViewModel{
    func SignInView() -> some View{
        return SplashViewRouter.makeSignInView()
        
        
    }
    
    
}

    

