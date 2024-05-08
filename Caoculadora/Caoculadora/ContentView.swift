//
//  ContentView.swift
//  Caoculadora
//
//  Created by Bruno Cezario on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months: Int?
    
    var body: some View {
        VStack(alignment: .leading){
        
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField(
                "Quantos anos completos tem seu cão",
                value: $years,
                format: .number
            )
            Text("Meses")
            TextField(
                "E quantos meses além disso ele tem?",
                value: $months,
                format: .number
            )
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
    }
}

#Preview {
    ContentView()
}
