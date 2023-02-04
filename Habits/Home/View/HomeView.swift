//
//  HomeView.swift
//  Habits
//
//  Created by Joao Vitor Taschetto on 15/02/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    
    var body: some View {
        Text("eai bao?")
            .background(Color.white)
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView(viewModel: HomeViewModel())
    }
}
