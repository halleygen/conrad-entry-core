//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

// MARK: - PartialShipmentKey

// public protocol _PartialShipmentKey {
//    static var id: String { get }
// }

public protocol PartialShipmentKey {
    static var id: String { get }
    associatedtype MutationRequest: Codable
    associatedtype ResponseDTO: Codable
}

public extension PartialShipmentKey {
    static func ~= (pattern: Self.Type, value: String) -> Bool {
        pattern.id == value
    }
}

// MARK: - Keys

public enum ShipmentDetailsKey: PartialShipmentKey {
    public static let id = "details"
    public typealias MutationRequest = MutateShipmentDetailsRequest
    public typealias ResponseDTO = ShipmentDetailsDTO
}

public enum BillOfLadingKey: PartialShipmentKey {
    public static let id = "bill-of-lading"
    public typealias MutationRequest = MutateBillOfLadingRequest
    public typealias ResponseDTO = BillOfLadingDTO
}

public enum DischargeKey: PartialShipmentKey {
    public static let id = "discharge"
    public typealias MutationRequest = MutateDischargeRequest
    public typealias ResponseDTO = DischargeDTO
}

public enum SettlementWeightKey: PartialShipmentKey {
    public static let id = "settlement-weight"
    public typealias MutationRequest = MutateDischargeWeightRequest
    public typealias ResponseDTO = DischargeWeightDTO
}

public enum ReferenceWeightKey: PartialShipmentKey {
    public static let id = "reference-weight"
    public typealias MutationRequest = MutateDischargeWeightRequest
    public typealias ResponseDTO = DischargeWeightDTO
}

public enum SampleCollectionKey: PartialShipmentKey {
    public static let id = "sample-collection"
    public typealias MutationRequest = MutateSampleCollectionRequest
    public typealias ResponseDTO = SampleCollectionDTO
}

public enum SampleReductionKey: PartialShipmentKey {
    public static let id = "sample-reduction"
    public typealias MutationRequest = MutateSampleReductionRequest
    public typealias ResponseDTO = SampleReductionDTO
}

public enum MoistureDeterminationKey: PartialShipmentKey {
    public static let id = "moisture-determination"
    public typealias MutationRequest = MutateMoistureDeterminationRequest
    public typealias ResponseDTO = MoistureDeterminationDTO
}

public enum SamplePreparationKey: PartialShipmentKey {
    public static let id = "sample-preparation"
    public typealias MutationRequest = MutateSamplePreparationRequest
    public typealias ResponseDTO = SamplePreparationDTO
}

// MARK: - Helpers

public extension PartialShipmentKey where Self == ShipmentDetailsKey {
    static var details: Self.Type { ShipmentDetailsKey.self }
}

public extension PartialShipmentKey where Self == BillOfLadingKey {
    static var billOfLading: Self.Type { BillOfLadingKey.self }
}

public extension PartialShipmentKey where Self == DischargeKey {
    static var discharge: Self.Type { DischargeKey.self }
}

public extension PartialShipmentKey where Self == SettlementWeightKey {
    static var settlementWeight: Self.Type { SettlementWeightKey.self }
}

public extension PartialShipmentKey where Self == ReferenceWeightKey {
    static var referenceWeight: Self.Type { ReferenceWeightKey.self }
}

public extension PartialShipmentKey where Self == SampleCollectionKey {
    static var sampleCollection: Self.Type { SampleCollectionKey.self }
}

public extension PartialShipmentKey where Self == SampleReductionKey {
    static var sampleReduction: Self.Type { SampleReductionKey.self }
}

public extension PartialShipmentKey where Self == MoistureDeterminationKey {
    static var moistureDetermination: Self.Type { MoistureDeterminationKey.self }
}

public extension PartialShipmentKey where Self == SamplePreparationKey {
    static var samplePreparation: Self.Type { SamplePreparationKey.self }
}
