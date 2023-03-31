//
//  Movie.swift
//  MovieflixUIKit
//
//  Created by Pietro Ciuci on 26/03/23.
//

import Foundation

/// A set of movies
// MARK: - Movies
struct Movies: Codable {
    let dates: MoviesDates?
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

/// Don't know da faq is that
// MARK: - MoviesDates
struct MoviesDates: Codable {
    let maximum, minimum: String?
}

/// The actual movie
// MARK: - Movie
struct Movie: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case ab =  "ab"
    case aa =  "aa"
    case af =  "af"
    case ak =  "ak"
    case sq =  "sq"
    case am =  "am"
    case ar =  "ar"
    case an =  "an"
    case hy =  "hy"
    case `as` = "as"
    case av =  "av"
    case ae =  "ae"
    case ay = "ay"
    case az = "az"
    case bm = "bm"
    case ba = "ba"
    case eu = "eu"
    case be = "be"
    case bn = "bn"
    case bi = "bi"
    case bs = "bs"
    case br = "br"
    case bg = "bg"
    case my = "my"
    case ca = "ca"
    case ch = "ch"
    case ce = "ce"
    case ny = "ny"
    case zh = "zh"
    case cu = "cu"
    case cv = "cv"
    case kw = "kw"
    case co = "co"
    case cn = "cn"
    case cr = "cr"
    case hr = "hr"
    case cs = "cs"
    case da = "da"
    case dv = "dv"
    case nl = "nl"
    case dz = "dz"
    case en = "en"
    case eo = "eo"
    case et = "et"
    case ee = "ee"
    case fo = "fo"
    case fj = "fj"
    case fi = "fi"
    case fr = "fr"
    case fy = "fy"
    case ff = "ff"
    case gd = "gd"
    case gl = "gl"
    case lg = "lg"
    case ka = "ka"
    case de = "de"
    case el = "el"
    case kl = "kl"
    case gn = "gn"
    case gu = "gu"
    case ht = "ht"
    case ha = "ha"
    case he = "he"
    case hz = "hz"
    case hi = "hi"
    case ho = "ho"
    case hu = "hu"
    case `is` = "is"
    case io = "io"
    case ig = "ig"
    case id = "id"
    case ia = "ia"
    case ie = "ie"
    case iu = "iu"
    case ik = "ik"
    case ga = "ga"
    case it = "it"
    case ja = "ja"
    case jv = "jv"
    case kn = "kn"
    case kr = "kr"
    case ks = "ks"
    case kk = "kk"
    case km = "km"
    case ki = "ki"
    case rw = "rw"
    case ky = "ky"
    case kv = "kv"
    case kg = "kg"
    case ko = "ko"
    case kj = "kj"
    case ku = "ku"
    case lo = "lo"
    case la = "la"
    case lv = "lv"
    case li = "li"
    case ln = "ln"
    case lt = "lt"
    case lu = "lu"
    case lb = "lb"
    case mk = "mk"
    case mg = "mg"
    case ms = "ms"
    case ml = "ml"
    case mt = "mt"
    case gv = "gv"
    case mi = "mi"
    case mr = "mr"
    case mh = "mh"
    case mn = "mn"
    case na = "na"
    case nv = "nv"
    case nd = "nd"
    case nr = "nr"
    case ng = "ng"
    case ne = "ne"
    case no = "no"
    case nb = "nb"
    case nn = "nn"
    case ii = "ii"
    case oc = "oc"
    case oj = "oj"
    case or = "or"
    case om = "om"
    case os = "os"
    case pi = "pi"
    case ps = "ps"
    case fa = "fa"
    case pl = "pl"
    case pt = "pt"
    case pa = "pa"
    case qu = "qu"
    case ro = "ro"
    case rm = "rm"
    case rn = "rn"
    case ru = "ru"
    case se = "se"
    case sm = "sm"
    case sg = "sg"
    case sa = "sa"
    case sc = "sc"
    case sr = "sr"
    case sn = "sn"
    case sd = "sd"
    case sh = "sh"
    case si = "si"
    case sk = "sk"
    case sl = "sl"
    case so = "so"
    case st = "st"
    case es = "es"
    case su = "su"
    case sw = "sw"
    case ss = "ss"
    case sv = "sv"
    case tl = "tl"
    case ty = "ty"
    case tg = "tg"
    case ta = "ta"
    case tt = "tt"
    case te = "te"
    case th = "th"
    case bo = "bo"
    case ti = "ti"
    case to = "to"
    case ts = "ts"
    case tn = "tn"
    case tr = "tr"
    case tk = "tk"
    case tw = "tw"
    case ug = "ug"
    case uk = "uk"
    case ur = "ur"
    case uz = "uz"
    case ve = "ve"
    case vi = "vi"
    case vo = "vo"
    case wa = "wa"
    case cy = "cy"
    case wo = "wo"
    case xh = "xh"
    case yi = "yi"
    case yo = "yo"
    case za = "za"
    case zu = "zu"
}

//var nowPlayingMovies: [Movie] = []
