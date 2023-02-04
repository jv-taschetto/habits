//
//  CustomTextFieldStyle.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 24/02/23.
//

import SwiftUI


struct CustomTextFieldStyle: TextFieldStyle{
    public func _body(configuration: TextField<Self._Label>) -> some View{
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            
    }
    
}
