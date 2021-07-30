//
//  PlanningAddTimerMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2021/07/25.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningAddTimerMessage: Codable {
    public let time: TimeInterval
    
    public init(time: TimeInterval) {
        self.time = time
    }
}
