//
//  LockScreenWidgetBundle.swift
//  LockScreenWidget
//
//  Created by Bana Alshabib on 13/06/1445 AH.
//

import WidgetKit
import SwiftUI

@main
struct LockScreenWidgetBundle: WidgetBundle {
    var body: some Widget {
        LockScreenWidget()
        LockScreenWidgetLiveActivity()
    }
}
