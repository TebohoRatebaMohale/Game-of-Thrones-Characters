//////
//////  SplashScreen.swift
//////  Thrones
//////
//////  Created by Teboho Mohale on 2023/02/13.
//////
////


import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            TabviewView()
        }else{
            HStack{
                HStack{
                    Image("background")
                        .scaledToFit()
                        .padding(.top, -100.0)
                        .opacity(10.0)
                        .padding(.leading, -50)
                        .padding(.bottom, -380)
                        .overlay(
                        Image("splash")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.top, 750)
                        )
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeInOut(duration: 5.0)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                    
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
}
