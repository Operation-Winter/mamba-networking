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
        
        switch type {
        case PlanningCommands.HostKey.startSession.rawValue:
            let model = try container.decode(PlanningStartSessionMessage.self, forKey: .message)
            self = .startSession(uuid: uuid, message: model)
        case PlanningCommands.HostKey.addTicket.rawValue:
            let model = try container.decode(PlanningAddTicketMessage.self, forKey: .message)
            self = .addTicket(uuid: uuid, message: model)
        case PlanningCommands.HostKey.skipVote.rawValue:
            let model = try container.decode(PlanningSkipVoteMessage.self, forKey: .message)
            self = .skipVote(uuid: uuid, message: model)
        case PlanningCommands.HostKey.removeParticipant.rawValue:
            let model = try container.decode(PlanningRemoveParticipantMessage.self, forKey: .message)
            self = .removeParticipant(uuid: uuid, message: model)
        case PlanningCommands.HostKey.endSession.rawValue:
            self = .endSession(uuid: uuid)
        case PlanningCommands.HostKey.finishVoting.rawValue:
            self = .finishVoting(uuid: uuid)
        case PlanningCommands.HostKey.revote.rawValue:
            self = .revote(uuid: uuid)
        case PlanningCommands.HostKey.reconnect.rawValue:
            self = .reconnect(uuid: uuid)
        default:
            throw DecodingError.keyNotFound(CodingKeys.message, DecodingError.Context(codingPath: [], debugDescription: "Invalid key: \(type)"))
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
        }
    }
    
    var rawValue: String {
        switch self {
        case .startSession:
            return PlanningCommands.HostKey.startSession.rawValue
        case .addTicket:
            return PlanningCommands.HostKey.addTicket.rawValue
        case .skipVote:
            return PlanningCommands.HostKey.skipVote.rawValue
        case .removeParticipant:
            return PlanningCommands.HostKey.removeParticipant.rawValue
        case .endSession:
            return PlanningCommands.HostKey.endSession.rawValue
        case .finishVoting:
            return PlanningCommands.HostKey.finishVoting.rawValue
        case .revote:
            return PlanningCommands.HostKey.revote.rawValue
        case .reconnect:
            return PlanningCommands.HostKey.reconnect.rawValue
        }
    }
}
