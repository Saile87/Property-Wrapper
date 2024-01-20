//
//  StateObjectView.swift
//  PropertyWrapper
//
//  Created by Elias Breitenbach on 20.01.24.
//

import SwiftUI

class Zaehler: ObservableObject {
    
//    Damit der Zähler nun hochgezählt werden kann und sich die Preview mit verändern soll, muss an dieser stelle hier die var zahl @Published sein!!!
    @Published var zahl: Int = 0
}

struct StateObjectView: View {
    
    //    State und StateObject werden immer Initialisiert
    //    Die zaehler ist durch Zaehler() Initialisiert!!!
    
    @StateObject private var zaehler = Zaehler()
    
//    @StateObject muss immer private sein denn die Instanz wird hier selber in der View erzeugt und wir
//    bekommen die nicht übergeben und die View hält simit den Source of Truth
    
    var body: some View {
        Button {
            zaehler.zahl += 1
        } label: {
            Text("Drück mich \(zaehler.zahl)")
        }
    }
}

#Preview {
    StateObjectView()
}
