//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public enum WetDryConversion {
    public static func dryWeight<Value: BinaryFloatingPoint>(wetWeight: Value, moisturePercentage: Value) -> Value {
        wetWeight * (1 - moisturePercentage)
    }

    public static func wetWeight<Value: BinaryFloatingPoint>(dryWeight: Value, moisturePercentage: Value) -> Value {
        dryWeight / (1 - moisturePercentage)
    }

    public static func moisturePercentage<Value: BinaryFloatingPoint>(wetWeight: Value, dryWeight: Value) -> Value {
        1 - (dryWeight / wetWeight)
    }
}

public extension WetDryConversion {
    static func dryWeight<Value: BinaryFloatingPoint>(wetWeight: Value?, moisturePercentage: Value?) -> Value? {
        guard let wetWeight, let moisturePercentage else { return nil }
        return dryWeight(wetWeight: wetWeight, moisturePercentage: moisturePercentage)
    }

    static func wetWeight<Value: BinaryFloatingPoint>(dryWeight: Value?, moisturePercentage: Value?) -> Value? {
        guard let dryWeight, let moisturePercentage else { return nil }
        return wetWeight(dryWeight: dryWeight, moisturePercentage: moisturePercentage)
    }

    static func moisturePercentage<Value: BinaryFloatingPoint>(wetWeight: Value?, dryWeight: Value?) -> Value? {
        guard let wetWeight, let dryWeight else { return nil }
        return moisturePercentage(wetWeight: wetWeight, dryWeight: dryWeight)
    }
}

public extension WetDryConversion {
    static func dryWeight(wetWeight: NSNumber?, moisturePercentage: NSNumber?) -> Double? {
        guard let wetWeight = wetWeight?.doubleValue, let moisturePercentage = moisturePercentage?.doubleValue else { return nil }
        return dryWeight(wetWeight: wetWeight, moisturePercentage: moisturePercentage)
    }

    static func wetWeight(dryWeight: NSNumber?, moisturePercentage: NSNumber?) -> Double? {
        guard let dryWeight = dryWeight?.doubleValue, let moisturePercentage = moisturePercentage?.doubleValue else { return nil }
        return wetWeight(dryWeight: dryWeight, moisturePercentage: moisturePercentage)
    }

    static func moisturePercentage(wetWeight: NSNumber?, dryWeight: NSNumber?) -> Double? {
        guard let wetWeight = wetWeight?.doubleValue, let dryWeight = dryWeight?.doubleValue else { return nil }
        return moisturePercentage(wetWeight: wetWeight, dryWeight: dryWeight)
    }
}
