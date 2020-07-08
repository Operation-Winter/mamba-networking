import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(mamba_ios_networkingTests.allTests),
    ]
}
#endif
