//
//  TabviewView.swift
//  Thrones
//
//  Created by Teboho Mohale on 2023/02/14.
//

import SwiftUI

struct TabviewView: View {
    var body: some View {
        ZStack {
            HStack{
                TabView{
                    ContentView()
                        .tabItem{
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    ImageSlider()
                        .tabItem{
                            Image(systemName: "camera.fill")
                            Text("BTS")
                        }
                    
                }
            }
        }
    }
}

struct TabviewView_Previews: PreviewProvider {
    static var previews: some View {
        TabviewView()
    }
}
