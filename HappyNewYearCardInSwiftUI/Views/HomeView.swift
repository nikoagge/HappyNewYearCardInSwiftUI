//
//  HomeView.swift
//  HappyNewYearCardInSwiftUI
//
//  Created by Nikos Aggelidis on 1/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            DrinkView()
            
            VStack {
                Spacer()
                    .frame(height: 13)
                
                Text("Happy 2024")
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                
                Text("With health & hapiness")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("By nikoagge")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
