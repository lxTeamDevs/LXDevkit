//
//  LXDevkitNetworkLayer.swift
//  LXDevkitNetworkLayer
//
//  Created by Artak Gevorgyan on 27.06.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.

import Foundation

public final class LXDevkitNetworkLayer {
        
    static let shared = LXDevkitNetworkLayer()

    var hostName: String = ""
    var version: String = ""
    
    func initWith(hostName: String, version: String) {
        self.hostName = hostName
        self.version = version
    }

}
