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
                        .accessibility(label: accessibilityLabel(for: item.image))
                        .accessibility(hint: Text("Icon"))
                    VStack(alignment: .leading){
                        Text(item.text)
                            .bold()
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                            .accessibility(label: Text(item.text))
                        Text(item.title)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                            .accessibility(label: Text(item.title))
                    }.padding()
                }
                .accessibilityElement(children: .combine)
            }
            .padding([.leading, .trailing, .bottom])
        }
        .accessibilityElement(children: .contain)
        .accessibility(label: Text("Onboarding Items"))
    }
    
    private func accessibilityLabel(for image: String) -> Text {
        switch image {
        case "cross.case":
            return Text("Cross Case Icon")
        case "bandage":
            return Text("Bandage Icon")
        case "applewatch":
            return Text("Apple Watch Icon")
        case "accessibility":
            return Text("Accessibility Icon")
        default:
            return Text("Unknown Icon")
        }
    }
}

struct OnboardingView: View {
    let model: OnboardingViewModel
    @State private var isOnboardingCompleted = false

    var body: some View {
        NavigationView {
            VStack {
                Text(model.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                    .accessibility(label: Text(model.title))
                ScrollView {
                    OnboardingListView(items: model.items)
                }
                NavigationLink(destination: ContentView(), isActive: $isOnboardingCompleted) {
                    Button(action: {
                        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                        isOnboardingCompleted = true
                    }, label: {
                        Text(model.buttonLabel).padding()
                            .frame(width: 300)
                    })
                    .background(Color(.accent))
                    .cornerRadius(15)
                    .accentColor(.white)
                    .padding(50)
                    .padding([.bottom, .leading, .trailing])
                    .accessibility(label: Text(model.buttonLabel))
                }
            }
            .accessibilityElement(children: .contain)
            .accessibility(label: Text("Onboarding View"))
        }
        .onAppear {
            if UserDefaults.standard.bool(forKey: "isOnboardingCompleted") {
                isOnboardingCompleted = true
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = OnboardingViewModel(
            title: "Welcome to Mondjed",
            items: [
                OnboardingItem(image: "cross.case", title: "Help your colleague as soon as possible.", text: "Heimlich"),
                OnboardingItem(image: "bandage", title: "Follow the instructions thoroughly and bandage the wounds in the right way.", text: "bandage"),
                OnboardingItem(image: "applewatch", title: "Mondjed available on iPhone and Apple Watch.", text: "iPhone and Apple Watch"),
                OnboardingItem(image: "accessibility", title: "Mondjed provides Accessibility (voice suspension, voice recognition).", text: "Accessibility")
            ],
            buttonLabel: "Continue"
        )
        return OnboardingView(model: model)
    }
}
