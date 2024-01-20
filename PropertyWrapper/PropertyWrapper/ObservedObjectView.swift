//
//  ObservedObjectView.swift
//  PropertyWrapper
//
//  Created by Elias Breitenbach on 20.01.24.
//

import SwiftUI

class ObservedObjectZaehler: ObservableObject {
    
//    Damit der Zähler nun hochgezählt werden kann und sich die Preview mit verändern soll, muss an dieser stelle hier die var zahl @Published sein!!!
    @Published var zahl: Int = 0
}

struct Anzeige2: View {
    
//    hier wird die variable "var zahl" nur übergeben ABER verwaltet die variable nicht!
        @ObservedObject var zaehler: ObservedObjectZaehler
    
        var body: some View {
            Button {
                zaehler.zahl += 1
            } label: {
                Text("Tap Me \(zaehler.zahl)")
            }
    }
}


struct ObservedObjectView: View {
    
//  Wird die "var zahl" geändert, dann ändert sich "var anzeige" auch mit, und umgehekrt genauso! ABER!! der Source of Truth bleibt hier bei @State private var zahl = 0
    
    @StateObject private var zaehler = ObservedObjectZaehler()
    
    var body: some View {
        VStack {
            Button {
                zaehler.zahl += 1
            } label: {
                Text("Drück mich \(zaehler.zahl)")
            }
            Anzeige2(zaehler: zaehler)
        }
    }
}

#Preview {
    ObservedObjectView()
}
