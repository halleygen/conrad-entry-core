//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import ConradEntryCore
import XCTest

final class ConradEntryCoreTests: XCTestCase {
    func testExample() {
        print(UserPrivilege.allCases.map(String.init(describing:)))
        print(AttachmentRole.allCases.map(String.init(_:)))
    }

    func testETag() throws {
        let values: KeyValuePairs<String, EntityTag?> = [
            "\"123456789\"": .strongValidator("123456789"),
            "\"123456789\"": .strongValidator("123456789"),
            "W/\"123456789\"": .weakValidator("123456789"),
            "": nil,
            "123456789": nil,
            "W/123456789": nil,
            "\"": nil,
            "\"\"": .strongValidator(""),
            "W/\"\"": .weakValidator(""),
            "\"123456789": nil,
            "123456789\"": nil,
            "\"123\"456789\"": .strongValidator("123\"456789"),
            "W/\"123\"456789\"": .weakValidator("123\"456789")
        ]

        for (string, expectedResult) in values {
            XCTAssertEqual(EntityTag(string), expectedResult)

            if let expectedResult {
                XCTAssertEqual(string, String(expectedResult))
            }
        }
    }
}
