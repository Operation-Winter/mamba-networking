//
//  PlanningCommand.JoinServerReceive+Extensions.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/31.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public extension PlanningCommands.JoinServerReceive {
    private enum CodingKeys: String, CodingKey {
        case uuid
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        let uuid = try container.decode(UUID.self, forKey: .uuid)
        
        guard let commandType = PlanningCommands.JoinServerReceiveKey(rawValue: type) else {
            throw DecodingError.keyNotFound(CodingKeys.message, DecodingError.Context(codingPath: [], debugDescription: "Invalid key: \(type)"))
        }
        switch commandType {
        case .joinSession:
            let model = try container.decode(PlanningJoinSessionMessage.self, forKey: .message)
            self = .joinSession(uuid: uuid, message: model)
        case .vote:
            let model = try container.decode(PlanningVoteMessage.self, forKey: .message)
            self = .vote(uuid: uuid, message: model)
        case .leaveSession:
            self = .leaveSession(uuid: uuid)
        case .reconnect:
            self = .reconnect(uuid: uuid)
        case .changeName:
            let model = try container.decode(PlanningChangeNameMessage.self, forKey: .message)
            self = .changeName(uuid: uuid, message: model)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .type)
        
        switch self {
        case .joinSession(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .vote(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .leaveSession(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .reconnect(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .changeName(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        }
    }
    
    var rawValue: String {
        switch self {
        case .joinSession:
            return PlanningCommands.JoinServerReceiveKey.joinSession.rawValue
        case .vote:
            return PlanningCommands.JoinServerReceiveKey.vote.rawValue
        case .leaveSession:
            return PlanningCommands.JoinServerReceiveKey.leaveSession.rawValue
        case .reconnect:
            return PlanningCommands.JoinServerReceiveKey.reconnect.rawValue
        case .changeName:
            return PlanningCommands.JoinServerReceiveKey.changeName.rawValue
        }
    }
}
