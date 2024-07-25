//
//  NetworkExtensionManager.swift
//  BlocklistApp
//
//  Created by Rohan Sakhare on 25/07/24.
//

import NetworkExtension

class NetworkExtensionManager {
    static let shared = NetworkExtensionManager()

    func startTunnel() {
        NETunnelProviderManager.loadAllFromPreferences { (managers, error) in
            if let error = error {
                print("Error loading preferences: \(error)")
                return
            }

            let manager = managers?.first ?? NETunnelProviderManager()

            let tunnelProtocol = NETunnelProviderProtocol()
            tunnelProtocol.providerBundleIdentifier = "com.yourcompany.BlocklistApp.PacketTunnel" // Replace with your actual bundle identifier
            tunnelProtocol.serverAddress = "127.0.0.1"

            manager.protocolConfiguration = tunnelProtocol
            manager.localizedDescription = "Blocklist App VPN"
            manager.isEnabled = true

            manager.saveToPreferences { error in
                if let error = error {
                    print("Error saving preferences: \(error)")
                } else {
                    manager.loadFromPreferences { error in
                        if let error = error {
                            print("Error loading preferences: \(error)")
                        } else {
                            do {
                                try manager.connection.startVPNTunnel()
                            } catch {
                                print("Error starting tunnel: \(error)")
                            }
                        }
                    }
                }
            }
        }
    }
}
