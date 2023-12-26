//
//  MonjedWidget.swift
//  MonjedWidget
//
//  Created by Bana Alshabib on 13/06/1445 AH.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let entry = SimpleEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MonjedWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Image(systemName: "Wedimg")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

@main
struct MonjedWidget: Widget {
    let kind: String = "MonjedWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MonjedWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Wedimg Widget")
        .description("This is a simple Wedimg widget.")
    }
}

struct MonjedWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonjedWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
