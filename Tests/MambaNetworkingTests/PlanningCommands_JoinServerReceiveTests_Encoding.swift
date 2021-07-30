//
//  PlanningCommands_JoinServerReceiveTests_Encoding.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCommands_JoinServerReceiveTests_Encoding: XCTestCase {

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
    
    func testChangeNameCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.changeName
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.changeName)
    }
}

fileprivate class Mocks {
    static let joinSession: PlanningCommands.JoinServerReceive = {
        let message = PlanningJoinSessionMessage(sessionCode: "000000", participantName: "Test")
        return .joinSession(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let vote: PlanningCommands.JoinServerReceive = {
        let message = PlanningVoteMessage(selectedCard: .coffee)
        return .vote(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let leaveSession = PlanningCommands.JoinServerReceive.leaveSession(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let reconnect = PlanningCommands.JoinServerReceive.reconnect(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    
    static let changeName: PlanningCommands.JoinServerReceive = {
        let message = PlanningChangeNameMessage(name: "TestName")
        return PlanningCommands.JoinServerReceive.changeName(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
}

fileprivate class Expected {
    static let joinSession = """
        {"type":"JOIN_SESSION","message":{"participantName":"Test","sessionCode":"000000"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let vote = """
        {"type":"VOTE","message":{"selectedCard":"COFFEE"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let leaveSession = """
        {"type":"LEAVE_SESSION","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let reconnect = """
        {"type":"RECONNECT","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let changeName = """
        {"type":"CHANGE_NAME","message":{"name":"TestName"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
}
