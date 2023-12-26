//
//  LockScreenWidgetBundle.swift
//  LockScreenWidget
//
//  Created by Bana Alshabib on 13/06/1445 AH.
//

import WidgetKit
import SwiftUI

@main
struct LockScreenWidget: Widget {
    private let kind: String = "LockScreenWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LockScreenWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(" Monjed Widget")
        .description("This is lock screen Monjed widget to access the app easy.")
    }
}
