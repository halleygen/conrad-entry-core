//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

/// The latitude, longitude, and altitude reported by the system.
public struct LocationDTO: Hashable, Codable {
    /// The latitude in degrees.
    public var latitude: Double

    /// The longitude in degrees.
    public var longitude: Double

    /// The altitude, measured in meters.
    public var altitude: Double?

    /// The radius of uncertainty for the location, measured in meters.
    public var horizontalAccuracy: Double

    /// The accuracy of the altitude value, measured in meters.
    public var verticalAccuracy: Double

    /// The time at which this location was determined.
    public var timestamp: Date

    public init(latitude: Double, longitude: Double, altitude: Double?, horizontalAccuracy: Double, verticalAccuracy: Double, timestamp: Date) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.timestamp = timestamp
    }

    /// Returns a Boolean value indicating whether the location's latitude and longitude values form valid coordinate.
    public var isValid: Bool {
        (-90 ... 90).contains(latitude) && (-180 ... 180).contains(longitude)
    }
}
