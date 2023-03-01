//
//  PlanningCommands.HostServerReceive+Extensions.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public extension PlanningCommands.HostServerReceive {
    private enum CodingKeys: String, CodingKey {
        case uuid
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        let uuid = try container.decode(UUID.self, forKey: .uuid)
        
        guard let commandType = PlanningCommands.HostServerReceiveKey(rawValue: type) else {
            throw DecodingError.keyNotFound(CodingKeys.message, DecodingError.Context(codingPath: [], debugDescription: "Invalid key: \(type)"))
        }
        switch commandType {
        case .startSession:
            let model = try container.decode(PlanningStartSessionMessage.self, forKey: .message)
            self = .startSession(uuid: uuid, message: model)
        case .addTicket:
            let model = try container.decode(PlanningTicketMessage.self, forKey: .message)
            self = .addTicket(uuid: uuid, message: model)
        case .skipVote:
            let model = try container.decode(PlanningSkipVoteMessage.self, forKey: .message)
            self = .skipVote(uuid: uuid, message: model)
        case .removeParticipant:
            let model = try container.decode(PlanningRemoveParticipantMessage.self, forKey: .message)
            self = .removeParticipant(uuid: uuid, message: model)
        case .endSession:
            self = .endSession(uuid: uuid)
        case .finishVoting:
            self = .finishVoting(uuid: uuid)
        case .revote:
            self = .revote(uuid: uuid)
        case .reconnect:
            self = .reconnect(uuid: uuid)
        case .editTicket:
            let model = try container.decode(PlanningTicketMessage.self, forKey: .message)
            self = .editTicket(uuid: uuid, message: model)
        case .addTimer:
            let model = try container.decode(PlanningAddTimerMessage.self, forKey: .message)
            self = .addTimer(uuid: uuid, message: model)
        case .cancelTimer:
            self = .cancelTimer(uuid: uuid)
        case .previousTickets:
            self = .previousTickets(uuid: uuid)
        case .requestCoffeeBreak:
            self = .requestCoffeeBreak(uuid: uuid)
        case .startCoffeeBreakVote:
            self = .startCoffeeBreakVote(uuid: uuid)
        case .coffeeBreakVote:
            let model = try container.decode(PlanningCoffeeVote.self, forKey: .message)
            self = .coffeeBreakVote(uuid: uuid, message: model)
        case .endCoffeeBreakVote:
            self = .endCoffeeBreakVote(uuid: uuid)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .type)
        
        switch self {
        case .startSession(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .addTicket(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .skipVote(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .removeParticipant(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .endSession(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .finishVoting(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .revote(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .reconnect(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .editTicket(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .addTimer(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .cancelTimer(uuid: let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .previousTickets(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .requestCoffeeBreak(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .startCoffeeBreakVote(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .endCoffeeBreakVote(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .coffeeBreakVote(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        }
    }
    
    var rawValue: String {
        switch self {
        case .startSession:
            return PlanningCommands.HostServerReceiveKey.startSession.rawValue
        case .addTicket:
            return PlanningCommands.HostServerReceiveKey.addTicket.rawValue
        case .skipVote:
            return PlanningCommands.HostServerReceiveKey.skipVote.rawValue
        case .removeParticipant:
            return PlanningCommands.HostServerReceiveKey.removeParticipant.rawValue
        case .endSession:
            return PlanningCommands.HostServerReceiveKey.endSession.rawValue
        case .finishVoting:
            return PlanningCommands.HostServerReceiveKey.finishVoting.rawValue
        case .revote:
            return PlanningCommands.HostServerReceiveKey.revote.rawValue
        case .reconnect:
            return PlanningCommands.HostServerReceiveKey.reconnect.rawValue
        case .editTicket:
            return PlanningCommands.HostServerReceiveKey.editTicket.rawValue
        case .addTimer:
            return PlanningCommands.HostServerReceiveKey.addTimer.rawValue
        case .cancelTimer:
            return PlanningCommands.HostServerReceiveKey.cancelTimer.rawValue
        case .previousTickets:
            return PlanningCommands.HostServerReceiveKey.previousTickets.rawValue
        case .requestCoffeeBreak:
            return PlanningCommands.HostServerReceiveKey.requestCoffeeBreak.rawValue
        case .startCoffeeBreakVote:
            return PlanningCommands.HostServerReceiveKey.startCoffeeBreakVote.rawValue
        case .endCoffeeBreakVote:
            return PlanningCommands.HostServerReceiveKey.endCoffeeBreakVote.rawValue
        case .coffeeBreakVote:
            return PlanningCommands.HostServerReceiveKey.coffeeBreakVote.rawValue
        }
    }
}
