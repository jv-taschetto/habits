//
//  SplashView.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 04/02/23.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    
    
    var body: some View{
        Group{
            switch viewModel.uiState {
            case .loading:
                LoadingView()
            case .goToSignInScreen:
                //navegar para proxima tela
                viewModel.SignInView()
            case .goToHomeScreen:
                Text("Carregar tela principal")
            case .error(let msg):
                LoadingView(error:msg)
            }
        }.onAppear(perform: viewModel.onAppear)
        
    }
}




extension SplashView{
    func LoadingView(error: String? = nil) -> some View{
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .ignoresSafeArea()
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true) ){
                        Alert(title: Text("Habits"), message: Text(error) , dismissButton: .default(Text("OK")){
                            //faz algo quando some o alerta
                        })
                    }
            }
        }
    }
    struct SplashView_Preview: PreviewProvider {
        static var previews: some View{
            ForEach(ColorScheme.allCases, id: \.self) {
                let viewModel = SplashViewModel ()
                SplashView (viewModel: viewModel)
                    .preferredColorScheme($0)
            }
            
            
        }
        
    }
}
