//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDTO: APIResponseItem {
    public var id: UUID { details.id }
    public var version: Date { details.version }

    public let details: ShipmentDetailsDTO
    public let billOfLading: ValueOrID<BillOfLadingDTO>?
    public let settlementWeight: ValueOrID<DischargeWeightDTO>?
    public let referenceWeight: ValueOrID<DischargeWeightDTO>?
    public let discharge: ValueOrID<DischargeDTO>?
    public let sampleCollection: ValueOrID<SampleCollectionDTO>?
    public let sampleReduction: ValueOrID<SampleReductionDTO>?
    public let moistureDetermination: ValueOrID<MoistureDeterminationDTO>?
    public let samplePreparation: ValueOrID<SamplePreparationDTO>?

    public init(details: ShipmentDetailsDTO, billOfLading: ValueOrID<BillOfLadingDTO>?, settlementWeight: ValueOrID<DischargeWeightDTO>?, referenceWeight: ValueOrID<DischargeWeightDTO>?, discharge: ValueOrID<DischargeDTO>?, sampleCollection: ValueOrID<SampleCollectionDTO>?, sampleReduction: ValueOrID<SampleReductionDTO>?, moistureDetermination: ValueOrID<MoistureDeterminationDTO>?, samplePreparation: ValueOrID<SamplePreparationDTO>?) {
        self.details = details
        self.billOfLading = billOfLading
        self.settlementWeight = settlementWeight
        self.referenceWeight = referenceWeight
        self.discharge = discharge
        self.sampleCollection = sampleCollection
        self.sampleReduction = sampleReduction
        self.moistureDetermination = moistureDetermination
        self.samplePreparation = samplePreparation
    }
}
