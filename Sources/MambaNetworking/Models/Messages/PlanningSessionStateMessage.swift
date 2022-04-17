//
//  PlanningSessionStateMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/30.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningSessionStateMessage: Codable {
    public let sessionCode: String
    public let sessionName: String
    public let availableCards: [PlanningCard]
    public let participants: [PlanningParticipant]
    public let ticket: PlanningTicket?
    public let timeLeft: Int?
    public let tags: Set<String>
    public let spectatorCount: Int
    public let coffeeRequestCount: Int
    public let coffeeVotes: [PlanningCoffeeVote]?
    
    public init(sessionCode: String,
                sessionName: String,
                availableCards: [PlanningCard],
                participants: [PlanningParticipant],
                ticket: PlanningTicket?,
                timeLeft: Int?,
                tags: Set<String>,
                spectatorCount: Int,
                coffeeRequestCount: Int,
                coffeeVotes: [PlanningCoffeeVote]?) {
        self.sessionCode = sessionCode
        self.sessionName = sessionName
        self.availableCards = availableCards
        self.participants = participants
        self.ticket = ticket
        self.timeLeft = timeLeft
        self.tags = tags
        self.spectatorCount = spectatorCount
        self.coffeeRequestCount = coffeeRequestCount
        self.coffeeVotes = coffeeVotes
    }
}
