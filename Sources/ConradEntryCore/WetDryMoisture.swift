//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public enum WetDryMoisture {
    public static func dry(wet: Double, moisture: Double) -> Double {
        assert((0 ... 1).contains(moisture), "Moisture value must be within 0 and 1 inclusive")
        return wet * (1 - moisture)
    }

    public static func wet(dry: Double, moisture: Double) -> Double {
        assert((0 ... 1).contains(moisture), "Moisture value must be within 0 and 1 inclusive")
        return dry / (1 - moisture)
    }

    public static func moisture(wet: Double, dry: Double) -> Double {
        assert(wet >= dry, "Wet value must be greater than or equal to dry value")
        return 1 - (dry / wet)
    }
}

public extension WetDryMoisture {
    static func dry(wet: Double?, moisture: Double?) -> Double? {
        guard let wet, let moisture else { return nil }
        return dry(wet: wet, moisture: moisture)
    }

    static func wetWeight(dry: Double?, moisture: Double?) -> Double? {
        guard let dry, let moisture else { return nil }
        return wet(dry: dry, moisture: moisture)
    }

    static func moisture(wet: Double?, dry: Double?) -> Double? {
        guard let wet, let dry else { return nil }
        return moisture(wet: wet, dry: dry)
    }
}

public extension WetDryMoisture {
    static func dry(wet: NSNumber?, moisture: NSNumber?) -> Double? {
        guard let wet = wet?.doubleValue, let moisture = moisture?.doubleValue else { return nil }
        return dry(wet: wet, moisture: moisture)
    }

    static func wet(dry: NSNumber?, moisture: NSNumber?) -> Double? {
        guard let dry = dry?.doubleValue, let moisture = moisture?.doubleValue else { return nil }
        return wet(dry: dry, moisture: moisture)
    }

    static func moisture(wet: NSNumber?, dry: NSNumber?) -> Double? {
        guard let wet = wet?.doubleValue, let dry = dry?.doubleValue else { return nil }
        return moisture(wet: wet, dry: dry)
    }
}

