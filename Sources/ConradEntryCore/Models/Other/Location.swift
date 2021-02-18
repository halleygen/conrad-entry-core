//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

/// The latitude, longitude, and course information reported by the system.
public struct Location: Hashable, Codable {
    /// The geographical coordinate information.
    var coordinate: Coordinate

    /// The altitude, measured in meters.
    var altitude: Double

    /// The radius of uncertainty for the location, measured in meters.
    var horizontalAccuracy: Double

    /// The accuracy of the altitude value, measured in meters.
    var verticalAccuracy: Double

    /// The time at which this location was determined.
    var timestamp: Date

    public init(coordinate: Location.Coordinate, altitude: Double, horizontalAccuracy: Double, verticalAccuracy: Double, timestamp: Date) {
        self.coordinate = coordinate
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.timestamp = timestamp
    }
}

public extension Location {
    /// The latitude and longitude associated with a location, specified using the WGS 84 reference frame.
    struct Coordinate: Hashable, Codable {
        /// The latitude in degrees.
        var latitude: Double

        /// The longitude in degrees.
        var longitude: Double

        /// Returns a Boolean value indicating whether the specified coordinate is valid.
        var isValid: Bool {
            (-90 ... 90).contains(latitude) && (-180 ... 180).contains(longitude)
        }
    }
}
