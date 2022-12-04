//
//  ContentView.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            HomeView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
