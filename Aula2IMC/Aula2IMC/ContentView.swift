//
//  ContentView.swift
//  Aula2IMC
//
//  Created by Student13 on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var back_color: Color = Color("back_0")
    @State private var peso: Double? = nil
    @State private var altura: Double? = nil
    @State private var result: Double? = nil
    @State private var resultS: String = ""
    
    @State private var shadowTable: Float = 7.0
    
    @State private var showErrorAlert: Bool = false
    @State private var errorAlertMessage: String = "Erro inesperado ocorreu"
    
    var body: some View {
        ZStack {
            back_color.ignoresSafeArea()
            VStack {
                Text("Calculadora de IMC")
                    .font(.title)
                
                TextField("peso em kg. Ex: 60 kg", value: $peso, format: .number)
                    .modifier(ClearButton(value: $peso))
                    .frame(width: 300)
                    .padding()
                
                TextField("altura em cm. Ex: 174 cm", value: $altura, format: .number)
                    .modifier(ClearButton(value: $altura))
                    .frame(width: 300)
                
                HStack{
                    Button {
                        if peso == nil || altura == nil {
                            result = nil
                            showErrorAlert = true
                            errorAlertMessage = "Preencha todas as informações necessárias"
                        } else {
                            let pesoR = peso ?? 0
                            let alturaR = (altura ?? 0) / 100
                            let resultR = pesoR / (alturaR * alturaR)
                            
                            if resultR.isNaN {
                                result = nil
                                showErrorAlert = true
                                errorAlertMessage = "Erro inesperado"
                            } else if altura == 0 {
                                result = nil
                                showErrorAlert = true
                                errorAlertMessage = "Altura não pode ser zero"
                            } else if peso == 0 {
                                result = nil
                                showErrorAlert = true
                                errorAlertMessage = "Voce não pesa zero!"
                            } else {
                                result = resultR
                                switch resultR {
                                case _ where resultR < 18.5:
                                    back_color = Color("back_1")
                                    resultS = "Baixo peso"
                                case _ where resultR >= 18.5 && resultR < 25:
                                    back_color = Color("back_2")
                                    resultS = "Normal"
                                case _ where resultR >= 25 && resultR < 30:
                                    back_color = Color("back_3")
                                    resultS = "Sobrepeso"
                                case _ where resultR >= 30:
                                    back_color = Color("back_4")
                                    resultS = "Obesidade"
                                default:
                                    back_color = Color("back_0")
                                    result = nil
                                    resultS = ""
                                }
                            }
                        }
                        
                    } label: {
                        Text("Calcular")
                    }.alert(errorAlertMessage, isPresented: $showErrorAlert) {
                    }
                    
//                    if result != nil {
//                        Button(action: {
//                            peso = nil
//                            altura = nil
//                        }, label: {
//                            Text("Limpar")
//                        })
//                    }
                }
                
                Spacer()
                
                //                result != nil ? Text(String(format: "%.0f", result ?? 0)) : nil
                
                if result != nil {
                    Text(resultS)
                        .font(.title2)
                    Text(String(format: "%.0f", result ?? 0))
                }
                
                Spacer()
                
                Image("tabela_imc")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: CGFloat(shadowTable))
            }
            .padding().textFieldStyle(.roundedBorder).buttonStyle(.borderedProminent)
        }
    }
}

struct ClearButton: ViewModifier
{
    @Binding var value: Double?

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content

            if value != nil
            {
                Button(action:
                {
                    self.value = nil
                })
                {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
