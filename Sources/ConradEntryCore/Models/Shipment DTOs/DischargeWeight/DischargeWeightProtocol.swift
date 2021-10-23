//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol DischargeWeightProtocol {
    var kind: DischargeWeightKind { get }
    var methodID: Int { get }
    var weighingPointID: Int { get }
    var weighingCompany: String { get }
    var startTime: Date { get }
    var finishTime: Date { get }
    var wetMetricTonnes: Double { get }
    var moisturePercentage: Double { get }
    var dryMetricTonnes: Double { get }
    var equipmentName: String? { get }
    var equipmentModel: String? { get }
    var equipmentLocation: LocationDTO? { get }
    var equipmentCertificationDate: Date? { get }
    var calibrationCheck: CalibrationCheck? { get }
    var abcCheck: ABCCheck? { get }
    var tallymen: Tallymen? { get }
    var transparencyID: Int { get }
    var comments: [String] { get }
}

public extension DischargeWeightProtocol {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}
