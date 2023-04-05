//
//  Providers.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 05/04/23.
//

import Foundation

// MARK: - Providers
struct Providers: Codable {
    let id: Int?
    let results: Provider?
}

// MARK: - Results
struct Provider: Codable {
    let ad: Ad?
    let ae, ag, al, ar: AE?
    let at, au, ba: AE?
    let bb: Ad?
    let be, bg: AE?
    let bm: Ad?
    let bo, br: AE?
    let bs: Ad?
    let ca, ch, ci, cl: AE?
    let co, cr, cv, cz: AE?
    let de, dk, resultsDO, ec: AE?
    let ee: AE?
    let eg: Ad?
    let es, fi, fj, fr: AE?
    let gb: AE?
    let gf, gg: Ad?
    let gh: AE?
    let gi: Ad?
    let gr, gt, hk, hn: AE?
    let hr, hu, id, ie: AE?
    let il: AE?
    let resultsIN: In?
    let resultsIS, it, jm, jp: AE?
    let kr: AE?
    let lc, li: Ad?
    let lt, lv: AE?
    let mc: Ad?
    let md, mk, mt, mu: AE?
    let mx: AE?
    let my: Ad?
    let mz, ne, nl, no: AE?
    let nz, pa, pe: AE?
    let pf: Ad?
    let ph, pl, pt, py: AE?
    let ro: Ad?
    let rs, ru, sa, se: AE?
    let sg, si, sk: AE?
    let sm: Ad?
    let sn, sv: AE?
    let tc: Ad?
    let th, tr, tt, tw: AE?
    let tz, ug, us, uy: AE?
    let ve, za, zm: AE?

    enum CodingKeys: String, CodingKey {
        case ad = "AD"
        case ae = "AE"
        case ag = "AG"
        case al = "AL"
        case ar = "AR"
        case at = "AT"
        case au = "AU"
        case ba = "BA"
        case bb = "BB"
        case be = "BE"
        case bg = "BG"
        case bm = "BM"
        case bo = "BO"
        case br = "BR"
        case bs = "BS"
        case ca = "CA"
        case ch = "CH"
        case ci = "CI"
        case cl = "CL"
        case co = "CO"
        case cr = "CR"
        case cv = "CV"
        case cz = "CZ"
        case de = "DE"
        case dk = "DK"
        case resultsDO = "DO"
        case ec = "EC"
        case ee = "EE"
        case eg = "EG"
        case es = "ES"
        case fi = "FI"
        case fj = "FJ"
        case fr = "FR"
        case gb = "GB"
        case gf = "GF"
        case gg = "GG"
        case gh = "GH"
        case gi = "GI"
        case gr = "GR"
        case gt = "GT"
        case hk = "HK"
        case hn = "HN"
        case hr = "HR"
        case hu = "HU"
        case id = "ID"
        case ie = "IE"
        case il = "IL"
        case resultsIN = "IN"
        case resultsIS = "IS"
        case it = "IT"
        case jm = "JM"
        case jp = "JP"
        case kr = "KR"
        case lc = "LC"
        case li = "LI"
        case lt = "LT"
        case lv = "LV"
        case mc = "MC"
        case md = "MD"
        case mk = "MK"
        case mt = "MT"
        case mu = "MU"
        case mx = "MX"
        case my = "MY"
        case mz = "MZ"
        case ne = "NE"
        case nl = "NL"
        case no = "NO"
        case nz = "NZ"
        case pa = "PA"
        case pe = "PE"
        case pf = "PF"
        case ph = "PH"
        case pl = "PL"
        case pt = "PT"
        case py = "PY"
        case ro = "RO"
        case rs = "RS"
        case ru = "RU"
        case sa = "SA"
        case se = "SE"
        case sg = "SG"
        case si = "SI"
        case sk = "SK"
        case sm = "SM"
        case sn = "SN"
        case sv = "SV"
        case tc = "TC"
        case th = "TH"
        case tr = "TR"
        case tt = "TT"
        case tw = "TW"
        case tz = "TZ"
        case ug = "UG"
        case us = "US"
        case uy = "UY"
        case ve = "VE"
        case za = "ZA"
        case zm = "ZM"
    }
}

// MARK: - Ad
struct Ad: Codable {
    let link: String?
    let flatrate: [Flatrate]?
}

// MARK: - Flatrate
struct Flatrate: Codable, Identifiable {
    let id = UUID()
    let logoPath: String?
    let providerID: Int?
    let providerName: String?
    let displayPriority: Int?

    enum CodingKeys: String, CodingKey {
        case logoPath = "logo_path"
        case providerID = "provider_id"
        case providerName = "provider_name"
        case displayPriority = "display_priority"
    }
}

// MARK: - AE
struct AE: Codable {
    let link: String?
    let flatrate: [Flatrate]?
    let rent, buy: [Flatrate]?
}

// MARK: - In
struct In: Codable {
    let link: String?
    let rent: [Flatrate]?
}
