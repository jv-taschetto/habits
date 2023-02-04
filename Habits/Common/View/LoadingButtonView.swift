//
//  LoadingButtonView.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 04/04/23.
//

import SwiftUI

struct LoadingButtonView: View{
    
    var action: () -> Void
    var Buttonlabel: String
    @State private var showProgress: Bool = false
    // var disabled: Bool = false
    var body: some View{
        Button{
            action()
            showProgress = true
        }label: {
            if showProgress {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                

                
            } else{
                Text(Buttonlabel)
                    .font(Font.system(.title3) .bold())
                    .foregroundColor(Color.white)
            }
        }
        .frame(maxWidth:.infinity, minHeight: 30)
        .padding()
        .background(showProgress ? Color("lightOrange"): Color.orange )
        .cornerRadius(4.0)
        .disabled(showProgress )
        
    }
    
        
////    var body: some View{
//        ZStack{
//            if showProgress{
//                Button(action:{ action()}, label: {
//                    Text(showProgress ? "" : text)
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical,14)
//                        .padding(.vertical, 16)
//                        .font(Font.system(.title3) .bold())
//                        .background(disabled ? Color ("lightOrange") : Color.orange)
//                        .foregroundColor(.white)
//                        .cornerRadius(4.0)
//                }) // .disabled(disabled || showProgress)
//
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle())
//                    .opacity(showProgress ? 1 : 0)
//            }
//        }
//    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {_ in
        VStack{
            
            LoadingButtonView(action: {
                print("Eai bao?")
            },
                              Buttonlabel: "Entrar"
            )
           // disabled: false)
        }.padding()
        .frame(maxWidth:  .infinity, maxHeight: .infinity)
        //.preferredColorScheme($0)
    }
       
    }
}
