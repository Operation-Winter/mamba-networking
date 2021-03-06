//
//  PlanningCommands_HostSendTests.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCommands_HostSendTests: XCTestCase {

    func testAddTicketCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.addTicket
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.addTicket)
    }
    
    func testStartSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.startSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.startSession)
    }
    
    func testSkipVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.skipVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.skipVote)
    }
    
    func testRemoveParticipantCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.removeParticipant
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.removeParticipant)
    }
    
    func testEndSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.endSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.endSession)
    }
    
    func testFinishVotingCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.finishVoting
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.finishVoting)
    }
    
    func testReconnectCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.reconnect
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.reconnect)
    }
    
    func testRevoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.revote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.revote)
    }

}

fileprivate class Mocks {
    static let addTicket: PlanningCommands.HostServerReceive = {
        let message = PlanningAddTicketMessage(title: "x", description: "Test")
        return .addTicket(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let startSession: PlanningCommands.HostServerReceive = {
        let message = PlanningStartSessionMessage(sessionName: "Test", availableCards: [PlanningCard.coffee])
        return .startSession(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let skipVote: PlanningCommands.HostServerReceive = {
        let message = PlanningSkipVoteMessage(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
        return .skipVote(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let removeParticipant: PlanningCommands.HostServerReceive = {
        let message = PlanningRemoveParticipantMessage(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
        return .removeParticipant(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let endSession = PlanningCommands.HostServerReceive.endSession(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let finishVoting = PlanningCommands.HostServerReceive.finishVoting(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let reconnect = PlanningCommands.HostServerReceive.reconnect(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let revote = PlanningCommands.HostServerReceive.revote(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
}

fileprivate class Expected {
    static let addTicket = """
        {"type":"ADD_TICKET","message":{"title":"x","description":"Test"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let startSession = """
        {"type":"START_SESSION","message":{"availableCards":["COFFEE"],"sessionName":"Test"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let skipVote = """
        {"type":"SKIP_VOTE","message":{"participantId":"754909ED-1648-4B51-AB55-4CA6C8910231"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let removeParticipant = """
        {"type":"REMOVE_PARTICIPANT","message":{"participantId":"754909ED-1648-4B51-AB55-4CA6C8910231"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let endSession = """
        {"type":"END_SESSION","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let finishVoting = """
        {"type":"FINISH_VOTING","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let reconnect = """
        {"type":"RECONNECT","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let revote = """
        {"type":"REVOTE","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
}
