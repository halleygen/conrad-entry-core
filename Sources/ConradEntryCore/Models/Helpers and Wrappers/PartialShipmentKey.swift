//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

// MARK: - PartialShipmentKey

public protocol PartialShipmentKey {
    associatedtype MutationRequest: Codable
    associatedtype ResponseDTO: APIResponseItem
    static var id: String { get }
    init()
}

public extension PartialShipmentKey {
    var id: String { Self.id }
}

// MARK: - Keys

public struct ShipmentDetailsKey: PartialShipmentKey {
    public init() {}
    public static let id = "details"
    public typealias MutationRequest = MutateShipmentDetailsRequest
    public typealias ResponseDTO = ShipmentDetailsDTO
}

public struct BillOfLadingKey: PartialShipmentKey {
    public init() {}
    public static let id = "bill-of-lading"
    public typealias MutationRequest = MutateBillOfLadingRequest
    public typealias ResponseDTO = BillOfLadingDTO
}

public struct DischargeKey: PartialShipmentKey {
    public init() {}
    public static let id = "discharge"
    public typealias MutationRequest = MutateDischargeRequest
    public typealias ResponseDTO = DischargeDTO
}

public struct SettlementWeightKey: PartialShipmentKey {
    public init() {}
    public static let id = "settlement-weight"
    public typealias MutationRequest = MutateDischargeWeightRequest
    public typealias ResponseDTO = DischargeWeightDTO
}

public struct ReferenceWeightKey: PartialShipmentKey {
    public init() {}
    public static let id = "reference-weight"
    public typealias MutationRequest = MutateDischargeWeightRequest
    public typealias ResponseDTO = DischargeWeightDTO
}

public struct SampleCollectionKey: PartialShipmentKey {
    public init() {}
    public static let id = "sample-collection"
    public typealias MutationRequest = MutateSampleCollectionRequest
    public typealias ResponseDTO = SampleCollectionDTO
}

public struct SampleReductionKey: PartialShipmentKey {
    public init() {}
    public static let id = "sample-reduction"
    public typealias MutationRequest = MutateSampleReductionRequest
    public typealias ResponseDTO = SampleReductionDTO
}

public struct MoistureDeterminationKey: PartialShipmentKey {
    public init() {}
    public static let id = "moisture-determination"
    public typealias MutationRequest = MutateMoistureDeterminationRequest
    public typealias ResponseDTO = MoistureDeterminationDTO
}

public struct SamplePreparationKey: PartialShipmentKey {
    public init() {}
    public static let id = "sample-preparation"
    public typealias MutationRequest = MutateSamplePreparationRequest
    public typealias ResponseDTO = SamplePreparationDTO
}

// MARK: - Helpers

public extension PartialShipmentKey where Self == ShipmentDetailsKey {
    static var details: Self { ShipmentDetailsKey() }
}

public extension PartialShipmentKey where Self == BillOfLadingKey {
    static var billOfLading: Self { BillOfLadingKey() }
}

public extension PartialShipmentKey where Self == DischargeKey {
    static var discharge: Self { DischargeKey() }
}

public extension PartialShipmentKey where Self == SettlementWeightKey {
    static var settlementWeight: Self { SettlementWeightKey() }
}

public extension PartialShipmentKey where Self == ReferenceWeightKey {
    static var referenceWeight: Self { ReferenceWeightKey() }
}

public extension PartialShipmentKey where Self == SampleCollectionKey {
    static var sampleCollection: Self { SampleCollectionKey() }
}

public extension PartialShipmentKey where Self == SampleReductionKey {
    static var sampleReduction: Self { SampleReductionKey() }
}

public extension PartialShipmentKey where Self == MoistureDeterminationKey {
    static var moistureDetermination: Self { MoistureDeterminationKey() }
}

public extension PartialShipmentKey where Self == SamplePreparationKey {
    static var samplePreparation: Self { SamplePreparationKey() }
}
