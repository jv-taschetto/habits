//
//  EditTextView.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 23/02/23.
//

import SwiftUI

struct EditTextView: View{
    @Binding var text: String
    
    var placeholder: String = ""
    var error: String? = nil
    var failure: Bool? = nil
    var keyboard: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var body: some View{
        VStack{
            if isSecure{
                SecureField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.orange, lineWidth: 0.8)
                    )
                .textFieldStyle(CustomTextFieldStyle())
                
            }else {
                
                
                TextField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.orange, lineWidth: 0.8)
                    )
                .textFieldStyle(CustomTextFieldStyle())}
                
            
            if let error = error,failure == true,
                !text.isEmpty {
                Text(error).foregroundColor(.red)
            }
    }
        .padding(.bottom, 10)
        
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {_ in
            VStack{
                
                EditTextView(text: .constant(""),
                             placeholder: "E-mail",
                             error: "Campo inválido",
                             failure: "a@a.com".count < 3)
                .padding()
            }
            .frame(maxWidth:  .infinity, maxHeight: .infinity)
        }

        }
                
    }


