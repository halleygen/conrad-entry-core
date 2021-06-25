//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

@testable import ConradEntryCore
import XCTest

final class ConradEntryCoreTests: XCTestCase {
    func testExample() {
        print(User.Privilege.allCases.map(String.init(describing:)))
        print(AttachmentRole.all.map(String.init(describing:)))
    }
}
