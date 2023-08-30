//
//  ImageSlider.swift
//  Thrones
//
//  Created by Teboho Mohale on 2023/02/14.
//

import SwiftUI

struct ImageSlider: View {
    private let images = ["1","2","3","4"]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) {item in
                
                Image("design")
                    .resizable()
                    .scaledToFit()
               
                Image("design3")
                    .resizable()
                    .scaledToFit()
                
                Image("design2")
                    .resizable()
                    .scaledToFit()
                
                Image("design1")
                    .resizable()
                    .scaledToFit()
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        
        .overlay(
        Image("bts")
            .resizable()
            .frame(width: 450, height: 300)
            .padding(.bottom, 550)
        )
        
        .overlay(
        Image("splash")
            .resizable()
            .frame(width: 200, height: 200)
            .padding(.top, 550)
        )
       
        .background(
            Image("game")
                .resizable()
                    .frame(width: 450, height: 1150)
                .scaledToFit()
                    .padding(.top, 200))
    }
        
}


struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider()
//            .previewLayout(.fixed(width: 400, height: 400))
        
        
    }
}
