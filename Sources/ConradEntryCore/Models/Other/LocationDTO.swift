//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

/// The latitude, longitude, and course information reported by the system.
public struct LocationDTO: Hashable, Codable {
    /// The geographical coordinate information.
    public var coordinate: Coordinate

    /// The altitude, measured in meters.
    public var altitude: Double

    /// The radius of uncertainty for the location, measured in meters.
    public var horizontalAccuracy: Double

    /// The accuracy of the altitude value, measured in meters.
    public var verticalAccuracy: Double

    /// The time at which this location was determined.
    public var timestamp: Date

    public init(coordinate: Coordinate, altitude: Double, horizontalAccuracy: Double, verticalAccuracy: Double, timestamp: Date) {
        self.coordinate = coordinate
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.timestamp = timestamp
    }
}

public extension LocationDTO {
    /// The latitude and longitude associated with a location, specified using the WGS 84 reference frame.
    struct Coordinate: Hashable, Codable {
        /// The latitude in degrees.
        public var latitude: Double

        /// The longitude in degrees.
        public var longitude: Double

        /// Returns a Boolean value indicating whether the specified coordinate is valid.
        public var isValid: Bool {
            (-90 ... 90).contains(latitude) && (-180 ... 180).contains(longitude)
        }

        public init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
