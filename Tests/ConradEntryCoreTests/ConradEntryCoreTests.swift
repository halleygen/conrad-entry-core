//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

@testable import ConradEntryCore
import XCTest

final class ConradEntryCoreTests: XCTestCase {
    func testExample() {
        print(User.Privilege.allCases.map(String.init(describing:)))
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
