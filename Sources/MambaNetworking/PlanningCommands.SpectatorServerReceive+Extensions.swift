//
//  PlanningCommands.SpectateServerReceive+Extensions.swift
//  
//
//  Created by Armand Kamffer on 2022/04/17.
//

import Foundation

public extension PlanningCommands.SpectatorServerReceive {
    private enum CodingKeys: String, CodingKey {
        case uuid
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        let uuid = try container.decode(UUID.self, forKey: .uuid)
        
        guard let commandType = PlanningCommands.SpectatorServerReceiveKey(rawValue: type) else {
            throw DecodingError.keyNotFound(CodingKeys.message, DecodingError.Context(codingPath: [], debugDescription: "Invalid key: \(type)"))
        }
        switch commandType {
        case .reconnect:
            self = .reconnect(uuid: uuid)
        case .joinSession:
            let model = try container.decode(PlanningSpectateSessionMessage.self, forKey: .message)
            self = .joinSession(uuid: uuid, message: model)
        case .leaveSession:
            self = .leaveSession(uuid: uuid)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .type)
        
        switch self {
        case .reconnect(let uuid):
            try container.encode(uuid, forKey: .uuid)
        case .joinSession(let uuid, let message):
            try container.encode(uuid, forKey: .uuid)
            try container.encode(message, forKey: .message)
        case .leaveSession(let uuid):
            try container.encode(uuid, forKey: .uuid)
        }
    }
    
    var rawValue: String {
        switch self {
        case .reconnect:
            return PlanningCommands.SpectatorServerReceiveKey.reconnect.rawValue
        case .joinSession:
            return PlanningCommands.SpectatorServerReceiveKey.joinSession.rawValue
        case .leaveSession:
            return PlanningCommands.SpectatorServerReceiveKey.leaveSession.rawValue
        }
    }
}
