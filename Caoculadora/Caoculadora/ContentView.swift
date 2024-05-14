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
  @State var result: Int?
  let portes = ["Pequeno", "Médio", "Grande"]
  @State var porteSelecionado = "Pequeno"
  @State var porteSelected = Porte.pequeno
  var body: some View {
    VStack(alignment: .leading, spacing: 20.0){
      Text("Qual a idade do seu cão?")
        .font(.header5)
      Text("Anos")
        .font(.body1)
      TextField(
        "Quantos anos completos tem seu cão",
        value: $years,
        format: .number
      ) .font(.body1)
      Text("Meses")
        .font(.body1)
      TextField(
        "E quantos meses além disso ele tem?",
        value: $months,
        format: .number
      )
      Text("Porte")
        .font(.body1)
      //MARK: - PICKER
      // aqui vai o segmented control
      Picker("Portes", selection: $porteSelected)
      {
        ForEach(Porte.allCases, id:\.self) { porte in
          Text(porte.rawValue) //p associar que o porte/enum é string
        }
      }
      .pickerStyle(.segmented)
      Divider()
      Spacer()
      if let result {
        Text("Seu cachorro tem, em idade humana...")
          .font(.body1)
        Text("\(result) anos")
          .font(.display)
      } else {
        Image(ImageResource.clarinha).resizable()
          .scaledToFit()
          .frame(maxHeight: 150)
          .frame(maxWidth: .infinity)
          .shadow(radius: 10)
      }
      Spacer()
      Button("Cãocular", action: processYears)
        .font(.body1)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.indigo)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 10))
      //  .clipShape(.rect(cornerRadius: 10))
    }
    .textFieldStyle(.roundedBorder)
    .keyboardType(.numberPad)
    .padding()
  }
  func processYears() {
    print("cãocular")
    guard let years, let months else {
      print("campos não preenchidos")
      return
    }
    guard months > 0 || years > 0 else {
      print("pelo menos um campo tem ser maior que zero")
      return
    }
    result = porteSelected.calcularIdade(deAnos: years,
                       eMeses: months)
  }
}
  #Preview {
    ContentView()
  }

