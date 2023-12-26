//
//  MonjedWedgitLiveActivity.swift
//  MonjedWedgit
//
//  Created by Bana Alshabib on 13/06/1445 AH.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MonjedWedgitAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MonjedWedgitLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MonjedWedgitAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MonjedWedgitAttributes {
    fileprivate static var preview: MonjedWedgitAttributes {
        MonjedWedgitAttributes(name: "World")
    }
}

extension MonjedWedgitAttributes.ContentState {
    fileprivate static var smiley: MonjedWedgitAttributes.ContentState {
        MonjedWedgitAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MonjedWedgitAttributes.ContentState {
         MonjedWedgitAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MonjedWedgitAttributes.preview) {
   MonjedWedgitLiveActivity()
} contentStates: {
    MonjedWedgitAttributes.ContentState.smiley
    MonjedWedgitAttributes.ContentState.starEyes
}
