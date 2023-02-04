//
//  SigninView.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 06/02/23.
//

import SwiftUI

struct SignInView :View {
    @ObservedObject var viewModel:SignInViewModel
    
   
    @State var action: Int? = 0
    @State var navigationHidden = true
    var body: some View {
        ZStack{
        
            if case SigninUIState.goToHomeScreen = viewModel.uiState{
                viewModel.homeView()
            } else {
                NavigationView {
                    ScrollView (showsIndicators: false){
                        
                        VStack (alignment: .center, spacing: 20){
                            Spacer(minLength: 36)
                            
                            VStack (alignment: .center, spacing: 8){
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                    
                                emailField
                                
                                passwordField
                                
                                enterButton
                                
                                registerLink
                                Text("Copyright @Taschetto")
                                    .foregroundColor(Color.gray)
                                    .font(Font.system(size: 13).bold())
                                    .padding(.top, 16)
                            }
                        }
                        
                        if case SigninUIState.error(let value) = viewModel.uiState{
                            Text("")
                                .alert(isPresented: .constant(true)){
                                    Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("OK")){})
                                }
                        }
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 32)
                       
                        .navigationBarTitle("Login", displayMode: .inline)
                        .navigationBarHidden(navigationHidden)
                }
                .onAppear {
                    self.navigationHidden = true
                }
                .onAppear{
                    self.navigationHidden = false
                }

            }
        }
    }
    
}
extension SignInView{
    var emailField: some View{
        EditTextView(text: $viewModel.email,
                    placeholder: "E-mail",
                     error: "e-mail invalido", failure: viewModel.email.count < 3, keyboard: .emailAddress)
        
        .foregroundColor(Color.black)

    }
}

extension SignInView{
    var passwordField: some View{
        EditTextView(text: $viewModel.password,
        placeholder: "Senha",
                     error: "senha deve ter no minimo 8 caracteres", failure: viewModel.password.count < 8, keyboard: .emailAddress,
        isSecure: true)
        
           
    }
}
// showProgress: self.viewModel.uiState ==   SigninUIState.loading,
// disabled: !email.isEmail() || password.count < 8)

extension SignInView{
    var enterButton: some View{
        LoadingButtonView(action: {
            viewModel.login()
            },
                          Buttonlabel: "Entrar"
            )
           // disabled: false)
    
        
    }
}

extension SignInView{
    var registerLink: some View{
        VStack{
            Text("Ainda nao possui uma conta?")
                .foregroundColor(.gray)
                .padding(.top,48)
            
            ZStack {
                NavigationLink(
                    destination: viewModel.signUpView(),
                    tag: 1,
                selection: $action,
                label: {EmptyView()})
                Button("Realize seu cadastro"){
                    self.action = 1
                }
            }
        }
            
        }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View{
        ForEach(ColorScheme.allCases, id: \.self){
            let viewModel = SignInViewModel()
            SignInView(viewModel: viewModel)
                .preferredColorScheme($0)
        }
    }
}
