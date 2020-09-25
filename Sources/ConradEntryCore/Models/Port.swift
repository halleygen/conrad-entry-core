//
//  File.swift
//  
//
//  Created by Jesse Halley on 25/9/20.
//

import Foundation

public struct Port: Hashable, Codable {
    public let name: String
    public let countryCode: String
    private let timeZoneIdentifier: String

    public var flag: String {
        countryCode.unicodeScalars.reduce(into: "") { result, scalar in
            result.unicodeScalars.append(Unicode.Scalar(0x1F1A5 &+ scalar.value)!)
        }
    }
    
    public var timeZone: TimeZone { TimeZone(identifier: timeZoneIdentifier)! }
}

extension Port: CustomStringConvertible {
    public var description: String {
        "\(name), \(countryCode) (\(timeZoneIdentifier)"
    }
}

extension Port: CaseIterable {
    public static let bayuquan = Port(name: "Bayuquan", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let beihai = Port(name: "Beihai", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let brunsbuttel = Port(name: "Brunsbüttel", countryCode: "DE", timeZoneIdentifier: "Europe/Berlin")
    public static let dalian = Port(name: "Dalian", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let fangcheng = Port(name: "Fangcheng", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let geraldton = Port(name: "Geraldton", countryCode: "AU", timeZoneIdentifier: "Australia/Perth")
    public static let hoboken = Port(name: "Hoboken", countryCode: "US", timeZoneIdentifier: "America/New_York")
    public static let huangpu = Port(name: "Huangpu", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let huludao = Port(name: "Huludao", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let isabel = Port(name: "Isabel", countryCode: "PH", timeZoneIdentifier: "Asia/Manila")
    public static let jinzhou = Port(name: "Jinzhou", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let lianyungang = Port(name: "Lianyungang", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let luoyuan = Port(name: "Luoyuan", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let nanjing = Port(name: "Nanjing", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let nantong = Port(name: "Nantong", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let ningde = Port(name: "Ningde", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let onsan = Port(name: "Onsan", countryCode: "KR", timeZoneIdentifier: "Asia/Seoul")
    public static let patache = Port(name: "Patache", countryCode: "CL", timeZoneIdentifier: "America/Santiago")
    public static let portHedland = Port(name: "Port Hedland", countryCode: "AU", timeZoneIdentifier: "Australia/Perth")
    public static let portKlang = Port(name: "Port Klang", countryCode: "MY", timeZoneIdentifier: "Asia/Kuala_Lumpur")
    public static let portPirie = Port(name: "Port Pirie", countryCode: "AU", timeZoneIdentifier: "Australia/Adelaide")
    public static let qingdao = Port(name: "Qingdao", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let qinhuangdao = Port(name: "Qinhuangdao", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let saganoseki = Port(name: "Saganoseki", countryCode: "JP", timeZoneIdentifier: "Asia/Tokyo")
    public static let shanghai = Port(name: "Shanghai", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let taichung = Port(name: "Taichung", countryCode: "TW", timeZoneIdentifier: "Asia/Taipei")
    public static let tianjin = Port(name: "Tianjin", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let weihai = Port(name: "Weihai", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let xiamen = Port(name: "Xiamen", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let yantai = Port(name: "Yantai", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let yunyuejiang = Port(name: "Yunyuejiang", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")
    public static let zhapu = Port(name: "Zhapu", countryCode: "CN", timeZoneIdentifier: "Asia/Shanghai")

    public static let allCases: [Port] = [
        bayuquan,
        beihai,
        brunsbuttel,
        dalian,
        fangcheng,
        geraldton,
        hoboken,
        huangpu,
        huludao,
        isabel,
        jinzhou,
        lianyungang,
        luoyuan,
        nanjing,
        nantong,
        ningde,
        onsan,
        patache,
        portHedland,
        portKlang,
        portPirie,
        qingdao,
        qinhuangdao,
        saganoseki,
        shanghai,
        taichung,
        tianjin,
        weihai,
        xiamen,
        yantai,
        yunyuejiang,
        zhapu
    ]
}
