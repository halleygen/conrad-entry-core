//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol LocationProtocol {
    /// The latitude in degrees.
    var latitude: Double { get }

    /// The longitude in degrees.
    var longitude: Double { get }

    /// The altitude, measured in meters.
    var altitude: Double? { get }

    /// The radius of uncertainty for the location, measured in meters.
    var horizontalAccuracy: Double { get }

    /// The accuracy of the altitude value, measured in meters.
    var verticalAccuracy: Double { get }

    /// The time at which this location was determined.
    var timestamp: Date { get }
}

public extension LocationProtocol {
    /// Returns a Boolean value indicating whether the location's latitude and longitude values form valid coordinate.
    var isValid: Bool {
        (-90 ... 90).contains(latitude) && (-180 ... 180).contains(longitude)
    }
}
