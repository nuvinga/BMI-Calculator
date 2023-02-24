//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Nuvin Godakanda Arachchi on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmiText: Double = 0.0
    @State private var errorAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Text("Weight")
                    .padding([.top, .leading])
                TextField("Enter your weight", text: $weightText)
                    .padding([.top, .leading, .trailing])
            }
            HStack {
                Text("Height")
                    .padding([.top, .leading])
                TextField("Enter your height", text: $heightText)
                    .padding([.top, .leading, .trailing])
            }
            Button {
                guard let weight = Double(self.weightText),
                      let height = Double(self.heightText) else {
                    errorAlert = true
                    return
                }
                
                self.bmiText = weight / pow((height)/3.281, 2)
            } label: {
                Text("Calculate BMI").font(.headline).padding().foregroundColor(Color.white).background(Color.accentColor).cornerRadius(10)
            }
            .alert(isPresented: $errorAlert){
                Alert(
                    title: Text("Error Calculating BMI"),
                    message: Text("The height and weight must be numbers!"),
                    dismissButton: .destructive(Text("Got it!"))
                )
            }
            .padding(.all)
            
            if let bmi = self.bmiText {
                if (bmi != 0.0) {
                    Text("Your BMI")
                        .font(.headline)
                    Text(String(bmi))
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(18.5...24.9 ~= Double(self.bmiText) ? Color.green : Color.red)
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
