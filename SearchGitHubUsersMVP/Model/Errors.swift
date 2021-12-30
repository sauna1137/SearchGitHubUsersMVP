//
//  Errors.swift
//  SearchGitHubUsersMVP
//
//  Created by KS on 2021/12/31.
//

import Foundation

enum FetchAPIError: Error {
    case noResult
    case someError


    var title: String {
        switch self {
        case .noResult: return "結果がありませんでした"
        case .someError: return "予期せぬエラーです"
        }
    }


}
