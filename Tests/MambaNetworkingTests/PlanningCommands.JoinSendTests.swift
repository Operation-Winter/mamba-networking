//
//  PlanningCommands_JoinSendTests.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCommands_JoinSendTests: XCTestCase {

    func testJoinSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.joinSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.joinSession)
    }
    
    func testVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.vote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.vote)
    }
    
    func testLeaveSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.leaveSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.leaveSession)
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
    
}

fileprivate class Mocks {
    static let joinSession: PlanningCommands.JoinServerReceive = {
        let message = PlanningJoinSessionMessage(sessionCode: "000000", participantName: "Test")
        return .joinSession(uuid: UUID(), message: message)
    }()
    
    static let vote: PlanningCommands.JoinServerReceive = {
        let message = PlanningVoteMessage(selectedCard: .coffee)
        return .vote(uuid: UUID(), message: message)
    }()
    
    static let leaveSession = PlanningCommands.JoinServerReceive.leaveSession(uuid: UUID())
    static let reconnect = PlanningCommands.JoinServerReceive.reconnect(uuid: UUID())
}

fileprivate class Expected {
    static let joinSession = """
        {"type":"JOIN_SESSION","message":{"participantName":"Test","sessionCode":"000000"}}
        """
    
    static let vote = """
        {"type":"VOTE","message":{"ticketId":"x","selectedCard":"COFFEE"}}
        """
    
    static let leaveSession = """
        {"type":"LEAVE_SESSION"}
        """
    
    static let reconnect = """
        {"type":"RECONNECT"}
        """
}
