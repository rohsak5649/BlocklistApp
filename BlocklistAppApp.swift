//
//  BlocklistAppApp.swift
//  BlocklistApp
//
//  Created by Rohan Sakhare on 25/07/24.
//

import SwiftUI

@main
struct BlocklistAppApp: App {
    init() {
        NetworkExtensionManager.shared.startTunnel()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
