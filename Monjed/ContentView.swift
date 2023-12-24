//
//  ContentView.swift
//  Monjed
//
//  Created by Bana Alshabib on 07/06/1445 AH.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isSheetPresented = false
    @State private var selectedRectangleIndex: Int?
    @State var searchTerm = ""
    
    
    

    var body: some View {
      
        let customGradient = LinearGradient(
                  gradient: Gradient(colors: [Color("BlueStart"), Color("BlueEnd")]),
                  startPoint: .leading,
                  endPoint: .trailing
              )
        
        let imageNameArray = ["eye.fill", "bandage.fill", "burns", "drowning", "bone fracture", "choking", "epilepsy", "bites"]
            
        let textArray = ["Eyes", "Cuts", "Burns", "Drowning", "Bone", "Choking", "Epilepsy", "Bites"]
        
            

        VStack {
            Text("Get well soon!")
                .font(.largeTitle)
                .bold()
                .offset(x: -67)
             
            
            Text("{He said, “Do not fear, I am with you, I hear and I see.}")
                .font(.caption)
                .offset(x: -25)
            
            
        } .navigationBarHidden(true)
        
        
  
        NavigationView {
            
                  ScrollView {
                      
//                      HStack {
//                          TextField("search first aid", text: $searchTerm)
//                      } .padding(10)
//                        .background(Color(.systemGray6))
//                        .cornerRadius(10)
//                        .padding(.horizontal)
                      
                      
                  
                      LazyVGrid(columns: [GridItem(.flexible(), spacing:-30), GridItem(.flexible(), spacing: -30)]) {
                          
                          ForEach(0..<8) { index in
                              
                              HStack {
                                  Rectangle()
                                      .fill(customGradient)
                                      .frame(width: 171, height: 117)
                                      .padding(1)
                                      .cornerRadius(10)
                                      .overlay (
                                        
                                        VStack {
                                            Image(systemName: "bandage.fill")
                                                .scaleEffect(1.5)
                                                .foregroundColor(.white)
                                                .bold()
                                                .frame(alignment: .leading)
                                                .padding()
                                            
                                           
                                            Text(textArray[index])
                                                .foregroundColor(.white)
                                                .bold()
                                                .padding()
                                            
                                               }
                                        
                                        ,alignment: .topLeading   )
                                  
                                  
                                  
                                    }
                              
                              
                              
                                  .onTapGesture {
                                      selectedRectangleIndex = index
                                      isSheetPresented.toggle()  }
                                 
                          } //index end bracket
                      } //lazy vgrid end bracket
                      
                  }
                  .sheet(isPresented: $isSheetPresented) {
                      if let index = selectedRectangleIndex {
                          RectangleDetailSheet(index: index)
                      }
                  }
            
        }.searchable(text: $searchTerm, prompt: "search first aid")
        
          }
      }

      struct RectangleDetailSheet: View {
          let index: Int
          
          let infoArray = [" cool cool cool ", " new new new", "wowowowow"]

          var body: some View {
              VStack {
                  Text(infoArray[index])
                      .font(.title)
                      .padding()
                  
                  
                  // Add additional details or content for the selected rectangle
                  Spacer()
        
                  
        
                  
              }
          }
      }
#Preview {
    ContentView()
}
