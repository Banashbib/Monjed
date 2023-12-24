//
//  OnbordingScreen.swift
//  Monjed
//
//  Created by Bana Alshabib on 11/06/1445 AH.
//
import SwiftUI

struct OnboardingItem {
    let id = UUID()
    let image: String
    let title: String
    let text: String
   
}

struct OnboardingViewModel {
    let title: String
    let items: [OnboardingItem]
    let buttonLabel: String
}

struct OnboardingListView: View {
    let items: [OnboardingItem]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(items, id: \.id) { item in
                HStack(alignment: .center) {
                    Image(systemName: item.image)
                        .foregroundColor(.accentColor)
                        .padding()
                        .font(.title)
                        .accessibility(hidden: true)
                    VStack(alignment: .leading){
                        Text(item.text)
                            .bold()
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(item.title)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding()
                }
            }
            .padding([.leading, .trailing, .bottom])
        }
    }
}

struct OnboardingView: View {
    let model: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text(model.title)
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            ScrollView {
                OnboardingListView(items: model.items)
                
            }
            Button(action: {}, label: {
                Text(model.buttonLabel).padding()
                    .frame(width:300)
            })
            .background(Color(.accent))
            .cornerRadius(15)
            .accentColor(.white)
            .padding(50)
            .padding([.bottom, .leading, .trailing])
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = OnboardingViewModel(
            title: "Welcome to Mondjed",
            items: [
                OnboardingItem(image: "cross.case", title: "Help your colleague as soon as possible.",text:"Heimlich"),
                OnboardingItem(image: "bandage", title: "Follow the instructions thoroughly and bandage the wounds in the right way.",text:"bandage"),
                OnboardingItem(image: "applewatch", title: "Mondjed available on iPhone and Apple Watch.",text:"iPhone and Apple Watch"),
                OnboardingItem(image: "accessibility", title: "Mondjed provides Accessibility (voice suspension, voice recognition).",text:"Accessibility")
            ],
            buttonLabel: "Continue"
        )
        return OnboardingView(model: model)
    }
}
