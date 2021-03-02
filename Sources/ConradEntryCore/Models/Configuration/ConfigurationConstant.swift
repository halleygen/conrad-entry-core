//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public protocol ConfigurationConstant: Identifiable, Hashable, Codable where ID == Int {
    associatedtype CodingKeys: RawRepresentable, CodingKey, CaseIterable where CodingKeys.RawValue == String
    var id: Int { get }
    var value: String { get }
    var representsOtherValue: Bool { get }

    func dictionaryRepresentation() -> [String: Any]
}

public extension ConfigurationConstant {
    func dictionaryRepresentation() -> [String: Any] {
        let keys = Set(CodingKeys.allCases.map(\.rawValue))
        let mirror = Mirror(reflecting: self)

        var dict: [String: Any] = [:]
        dict.reserveCapacity(mirror.children.count)

        for child in mirror.children {
            guard let label = child.label, keys.contains(label) else { continue }
            dict[label] = child.value
        }

        return dict
    }
}
