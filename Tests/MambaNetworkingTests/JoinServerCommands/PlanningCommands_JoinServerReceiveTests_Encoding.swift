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
        let mockedCommand = TestDataGenerator.JoinServerReceive.joinSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.joinSession)
    }
    
    func testVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.vote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.vote)
    }
    
    func testLeaveSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.leaveSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.leaveSession)
    }
    
    func testReconnectCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.reconnect
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.reconnect)
    }
    
    func testChangeNameCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.changeName
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.changeName)
    }
    
    func testRequestCoffeeBreakCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.requestCoffeeBreak
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.requestCoffeeBreak)
    }
    
    func testCoffeeBreakVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.coffeeBreakVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.coffeeBreakVote)
    }
    
    func testConcedeVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.JoinServerReceive.concedeVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.JoinServerReceiveEncoded.concedeVote)
    }
}
