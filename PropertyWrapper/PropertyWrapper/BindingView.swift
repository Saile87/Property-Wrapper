//
//  BindingView.swift
//  PropertyWrapper
//
//  Created by Elias Breitenbach on 20.01.24.
//

import SwiftUI

class BindingZaehler: ObservableObject {
    
//    Damit der Zähler nun hochgezählt werden kann und sich die Preview mit verändern soll, muss an dieser stelle hier die var zahl @Published sein!!!
    @Published var zahl: Int = 0
}

struct Anzeige: View {
    
//    hier wird die variable "var zahl" nur übergeben ABER verwaltet die variable nicht!
    @Binding var anzeige: Int
        var body: some View {
            Button {
                anzeige += 1
            } label: {
                Text("Tap Me \(anzeige)")
            }
    }
}


struct BindingView: View {
    
//  Wird die "var zahl" geändert, dann ändert sich "var anzeige" auch mit, und umgehekrt genauso! ABER!! der Source of Truth bleibt hier bei @State private var zahl = 0
    
    @State private var zahl = 0
    
    var body: some View {
        VStack {
            Button {
                zahl += 1
            } label: {
                Text("Drück mich \(zahl)")
            }
            Anzeige(anzeige: $zahl)
        }
    }
}



#Preview {
    BindingView()
}
