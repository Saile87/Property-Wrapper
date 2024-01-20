//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by Elias Breitenbach on 20.01.24.
//

import SwiftUI

struct StateView: View {
    
//    State und StateObject werden immer Initialisiert
//    Die Null hier ist Initialisiert!!!
    @State var zahl: Int = 0
    
    var body: some View {

        Button {
            zahl += 1
        } label: {
            Text("Drück mich \(zahl)")
        }
    }
}

#Preview {
    StateView()
}
