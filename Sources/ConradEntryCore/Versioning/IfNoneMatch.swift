//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

// MARK: - Shared

private func parseEntityTagList(_ string: String) -> [EntityTag]? {
    let splat = string.split(separator: ",")

    var tags: [EntityTag] = []
    tags.reserveCapacity(splat.count)

    for substring in splat {
        guard let tag = EntityTag(substring.trimmingCharacters(in: .whitespaces)) else { return nil }
        tags.append(tag)
    }

    return tags
}

// MARK: - IfNoneMatch

public enum IfNoneMatch {
    case catchall
    case tags([EntityTag])

    /// Returns a Boolean value that indicates whether the specified ETag matches the conditions that the predicate specifies.
    ///
    /// The requested method must not be performed if this condition evaluates to `false`.
    ///
    /// See [RFC 9110](https://httpwg.org/specs/rfc9110.html#field.if-none-match)\.
    public func evaluate(with value: (some EntityTagConvertible)?) -> Bool {
        evaluate(with: value?.entityTag)
    }

    /// Returns a Boolean value that indicates whether the specified ETag matches the conditions that the predicate specifies.
    ///
    /// The requested method must not be performed if this condition evaluates to `false`.
    ///
    /// See [RFC 9110](https://httpwg.org/specs/rfc9110.html#field.if-none-match)\.
    public func evaluate(with entityTag: EntityTag?) -> Bool {
        switch self {
        case .catchall:
            return entityTag == nil

        case let .tags(tags):
            guard let entityTag else { return true }
            return tags.allSatisfy { !$0.matches(entityTag, using: .weak) }
        }
    }

    public static func tag(_ tag: EntityTag) -> Self {
        let tags = [EntityTag](unsafeUninitializedCapacity: 1) { buffer, initialisedCount in
            buffer[0] = tag
            initialisedCount = 1
        }
        return .tags(tags)
    }
}

extension IfNoneMatch: LosslessStringConvertible {
    public var description: String {
        switch self {
        case .catchall: return "*"
        case let .tags(tags): return tags.map(\.description).joined(separator: ", ")
        }
    }

    public init?(_ description: String) {
        guard !description.isEmpty else { return nil }

        guard description != "*" else {
            self = .catchall
            return
        }

        guard let tags = parseEntityTagList(description) else { return nil }
        self = .tags(tags)
    }
}

// MARK: - IfMatch

public enum IfMatch {
    case catchall
    case tags([EntityTag])

    /// Returns a Boolean value that indicates whether the specified ETag matches the conditions that the predicate specifies.
    ///
    /// The requested method must not be performed if this condition evaluates to `false`.
    ///
    /// See [RFC 9110](https://httpwg.org/specs/rfc9110.html#field.if-match)\.
    public func evaluate(with value: (some EntityTagConvertible)?) -> Bool {
        evaluate(with: value?.entityTag)
    }

    /// Returns a Boolean value that indicates whether the specified ETag matches the conditions that the predicate specifies.
    ///
    /// The requested method must not be performed if this condition evaluates to `false`.
    ///
    /// See [RFC 9110](https://httpwg.org/specs/rfc9110.html#field.if-match)\.
    public func evaluate(with entityTag: EntityTag?) -> Bool {
        switch self {
        case .catchall:
            return entityTag != nil

        case let .tags(tags):
            guard let entityTag else { return false }
            return tags.contains(where: { $0.matches(entityTag, using: .strong) })
        }
    }

    public static func tag(_ tag: EntityTag) -> Self {
        let tags = [EntityTag](unsafeUninitializedCapacity: 1) { buffer, initialisedCount in
            buffer[0] = tag
            initialisedCount = 1
        }
        return .tags(tags)
    }
}

extension IfMatch: LosslessStringConvertible {
    public var description: String {
        switch self {
        case .catchall: return "*"
        case let .tags(tags): return tags.map(\.description).joined(separator: ", ")
        }
    }

    public init?(_ description: String) {
        guard !description.isEmpty else { return nil }

        guard description != "*" else {
            self = .catchall
            return
        }

        guard let tags = parseEntityTagList(description) else { return nil }
        self = .tags(tags)
    }
}
