//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

/// The latitude, longitude, and altitude reported by the system.
public struct LocationDTO: LocationProtocol, Hashable, Codable {
    public var latitude: Double
    public var longitude: Double
    public var altitude: Double?
    public var horizontalAccuracy: Double
    public var verticalAccuracy: Double
    public var timestamp: Date

    public init(latitude: Double, longitude: Double, altitude: Double?, horizontalAccuracy: Double, verticalAccuracy: Double, timestamp: Date) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.timestamp = timestamp
    }

    public init(_ other: LocationProtocol) {
        self.init(latitude: other.latitude, longitude: other.longitude, altitude: other.altitude, horizontalAccuracy: other.horizontalAccuracy, verticalAccuracy: other.verticalAccuracy, timestamp: other.timestamp)
    }
}
