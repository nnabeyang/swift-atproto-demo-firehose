//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class LabelDefs_Label: Codable {
        public var cid: String?
        public var cts: String
        public var exp: String?
        public var neg: Bool?
        public var sig: Data?
        public var src: String
        public var uri: String
        public var val: String
        public var ver: Int?

        public init(cid: String?, cts: String, exp: String?, neg: Bool?, sig: Data?, src: String, uri: String, val: String, ver: Int?) {
            self.cid = cid
            self.cts = cts
            self.exp = exp
            self.neg = neg
            self.sig = sig
            self.src = src
            self.uri = uri
            self.val = val
            self.ver = ver
        }

        enum CodingKeys: String, CodingKey {
            case cid
            case cts
            case exp
            case neg
            case sig
            case src
            case uri
            case val
            case ver
        }
    }

    public enum LabelDefs_LabelValue: RawRepresentable, Codable {
        public typealias RawValue = String

        case hide
        case noPromote
        case warn
        case noUnauthenticated
        case dmcaViolation
        case doxxing
        case porn
        case sexual
        case nudity
        case nsfl
        case gore
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "!hide":
                self = .hide
            case "!no-promote":
                self = .noPromote
            case "!warn":
                self = .warn
            case "!no-unauthenticated":
                self = .noUnauthenticated
            case "dmca-violation":
                self = .dmcaViolation
            case "doxxing":
                self = .doxxing
            case "porn":
                self = .porn
            case "sexual":
                self = .sexual
            case "nudity":
                self = .nudity
            case "nsfl":
                self = .nsfl
            case "gore":
                self = .gore
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .hide:
                "!hide"
            case .noPromote:
                "!no-promote"
            case .warn:
                "!warn"
            case .noUnauthenticated:
                "!no-unauthenticated"
            case .dmcaViolation:
                "dmca-violation"
            case .doxxing:
                "doxxing"
            case .porn:
                "porn"
            case .sexual:
                "sexual"
            case .nudity:
                "nudity"
            case .nsfl:
                "nsfl"
            case .gore:
                "gore"
            case let .unknown(value):
                value
            }
        }

        public init(from decoder: any Decoder) throws {
            let rawValue = try String(from: decoder)
            self = Self (rawValue: rawValue)!
        }

        public func encode(to encoder: any Encoder) throws {
            try rawValue.encode(to: encoder)
        }
    }

    public class LabelDefs_LabelValueDefinition: Codable {
        public var adultOnly: Bool?
        public var blurs: String
        public var defaultSetting: String?
        public var identifier: String
        public var locales: [LabelDefs_LabelValueDefinitionStrings]
        public var severity: String

        public init(adultOnly: Bool?, blurs: String, defaultSetting: String?, identifier: String, locales: [LabelDefs_LabelValueDefinitionStrings], severity: String) {
            self.adultOnly = adultOnly
            self.blurs = blurs
            self.defaultSetting = defaultSetting
            self.identifier = identifier
            self.locales = locales
            self.severity = severity
        }

        enum CodingKeys: String, CodingKey {
            case adultOnly
            case blurs
            case defaultSetting
            case identifier
            case locales
            case severity
        }
    }

    public enum LabelDefs_LabelValueDefinition_Blurs: RawRepresentable, Codable {
        public typealias RawValue = String

        case content
        case media
        case none
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "content":
                self = .content
            case "media":
                self = .media
            case "none":
                self = .none
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .content:
                "content"
            case .media:
                "media"
            case .none:
                "none"
            case let .unknown(value):
                value
            }
        }

        public init(from decoder: any Decoder) throws {
            let rawValue = try String(from: decoder)
            self = Self (rawValue: rawValue)!
        }

        public func encode(to encoder: any Encoder) throws {
            try rawValue.encode(to: encoder)
        }
    }

    public enum LabelDefs_LabelValueDefinition_DefaultSetting: RawRepresentable, Codable {
        public typealias RawValue = String

        case ignore
        case warn
        case hide
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "ignore":
                self = .ignore
            case "warn":
                self = .warn
            case "hide":
                self = .hide
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ignore:
                "ignore"
            case .warn:
                "warn"
            case .hide:
                "hide"
            case let .unknown(value):
                value
            }
        }

        public init(from decoder: any Decoder) throws {
            let rawValue = try String(from: decoder)
            self = Self (rawValue: rawValue)!
        }

        public func encode(to encoder: any Encoder) throws {
            try rawValue.encode(to: encoder)
        }
    }

    public enum LabelDefs_LabelValueDefinition_Severity: RawRepresentable, Codable {
        public typealias RawValue = String

        case inform
        case alert
        case none
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "inform":
                self = .inform
            case "alert":
                self = .alert
            case "none":
                self = .none
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .inform:
                "inform"
            case .alert:
                "alert"
            case .none:
                "none"
            case let .unknown(value):
                value
            }
        }

        public init(from decoder: any Decoder) throws {
            let rawValue = try String(from: decoder)
            self = Self (rawValue: rawValue)!
        }

        public func encode(to encoder: any Encoder) throws {
            try rawValue.encode(to: encoder)
        }
    }

    public class LabelDefs_LabelValueDefinitionStrings: Codable {
        public var description: String
        public var lang: String
        public var name: String

        public init(description: String, lang: String, name: String) {
            self.description = description
            self.lang = lang
            self.name = name
        }

        enum CodingKeys: String, CodingKey {
            case description
            case lang
            case name
        }
    }

    public class LabelDefs_SelfLabel: Codable {
        public var val: String

        public init(val: String) {
            self.val = val
        }

        enum CodingKeys: String, CodingKey {
            case val
        }
    }

    public class LabelDefs_SelfLabels: Codable {
        public var values: [LabelDefs_SelfLabel]

        public init(values: [LabelDefs_SelfLabel]) {
            self.values = values
        }

        enum CodingKeys: String, CodingKey {
            case values
        }
    }
}
