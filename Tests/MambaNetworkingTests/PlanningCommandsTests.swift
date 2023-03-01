//
//  PlanningCommandsTests.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/10.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCommandsTests: XCTestCase {

    func testHostServerSendKeyRawValues() {
        // When: Host command keys are mapped
        let hostKeys = PlanningCommands.HostServerSendKey.allCases
        
        // Then: the keys match expected values
        for (index, key) in hostKeys.enumerated() {
            XCTAssertEqual(key.rawValue, Expected.hostServerSendKey.element(at: index))
        }
    }
    
    func testHostServerReceiveKeyRawValues() {
        // When: Host command keys are mapped
        let hostKeys = PlanningCommands.HostServerReceiveKey.allCases
        
        // Then: the keys match expected values
        for (index, key) in hostKeys.enumerated() {
            XCTAssertEqual(key.rawValue, Expected.hostServerReceiveKey.element(at: index))
        }
    }
    
    func testJoinServerSendKeyRawValues() {
        // When: Join command keys are mapped
        let joinKeys = PlanningCommands.JoinServerSendKey.allCases
        
        // Then: the keys match expected values
        for (index, key) in joinKeys.enumerated() {
            XCTAssertEqual(key.rawValue, Expected.joinServerSendKey.element(at: index))
        }
    }
    
    func testJoinServerReceiveKeyRawValues() {
        // When: Join command keys are mapped
        let joinKeys = PlanningCommands.JoinServerReceiveKey.allCases
        
        // Then: the keys match expected values
        for (index, key) in joinKeys.enumerated() {
            XCTAssertEqual(key.rawValue, Expected.joinServerReceiveKey.element(at: index))
        }
    }

}

fileprivate class Expected {
    static let hostServerSendKey = [
        "NONE_STATE",
        "VOTING_STATE",
        "FINISHED_STATE",
        "INVALID_COMMAND",
        "PREVIOUS_TICKETS",
        "SESSION_IDLE_TIMEOUT",
        "COFFEE_VOTING",
        "COFFEE_VOTING_FINISHED"
    ]
    
    static let hostServerReceiveKey = [
        "START_SESSION",
        "ADD_TICKET",
        "SKIP_VOTE",
        "REMOVE_PARTICIPANT",
        "END_SESSION",
        "FINISH_VOTING",
        "REVOTE",
        "RECONNECT",
        "EDIT_TICKET",
        "ADD_TIMER",
        "CANCEL_TIMER",
        "PREVIOUS_TICKETS",
        "REQUEST_COFFEE_BREAK",
        "START_COFFEE_BREAK_VOTE",
        "FINISH_COFFEE_BREAK_VOTE",
        "END_COFFEE_BREAK_VOTE",
        "COFFEE_BREAK_VOTE"
    ]
    
    static let joinServerSendKey = [
        "NONE_STATE",
        "VOTING_STATE",
        "FINISHED_STATE",
        "INVALID_COMMAND",
        "INVALID_SESSION",
        "REMOVE_PARTICIPANT",
        "END_SESSION",
        "SESSION_IDLE_TIMEOUT",
        "COFFEE_VOTING",
        "COFFEE_VOTING_FINISHED"
    ]
    
    static let joinServerReceiveKey = [
        "JOIN_SESSION",
        "VOTE",
        "LEAVE_SESSION",
        "RECONNECT",
        "CHANGE_NAME",
        "REQUEST_COFFEE_BREAK",
        "COFFEE_BREAK_VOTE"
    ]
}
