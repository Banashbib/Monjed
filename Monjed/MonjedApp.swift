//
//  MonjedApp.swift
//  Monjed
//
//  Created by Bana Alshabib on 07/06/1445 AH.
//

import SwiftUI

@main
struct MonjedApp: App {
    @State private var isOnboardingCompleted = false

    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                ContentView()
            } else {
                OnboardingView(
                    model: OnboardingViewModel(
                        title: "Welcome to Mondjed",
                        items: [
                            OnboardingItem(image: "cross.case", title: "Help your colleague as soon as possible.", text: "Heimlich"),
                            OnboardingItem(image: "bandage", title: "Follow the instructions thoroughly and bandage the wounds in the right way.", text: "bandage"),
                            OnboardingItem(image: "applewatch", title: "Mondjed available on iPhone and Apple Watch.", text: "iPhone and Apple Watch"),
                            OnboardingItem(image: "accessibility", title: "Mondjed provides Accessibility (voice suspension, voice recognition).", text: "Accessibility")
                        ],
                        buttonLabel: "Continue"
                    )
                )
            }
        }
    }
}
