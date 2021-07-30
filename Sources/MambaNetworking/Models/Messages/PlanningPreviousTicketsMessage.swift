//
//  PlanningAddTimerMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2021/07/30.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningPreviousTicketsMessage: Codable {
    public let previousTickets: [PlanningTicket]
    
    public init(previousTickets: [PlanningTicket]) {
        self.previousTickets = previousTickets
    }
}
