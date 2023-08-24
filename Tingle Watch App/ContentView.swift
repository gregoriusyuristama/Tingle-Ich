//
//  ContentView.swift
//  Tingle Watch App
//
//  Created by Azella Mutyara on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TapView()
            GyroView()
            CrownView()
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
