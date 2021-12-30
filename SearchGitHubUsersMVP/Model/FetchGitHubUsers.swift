//
//  FetchGitHubUsers.swift
//  SearchGitHubUsersMVP
//
//  Created by KS on 2021/12/30.
//

import Foundation
import Alamofire

class FetchGitHubUsers {

    private let gitHubAPIURL = "https://api.github.com/search/users?q=" // ユーザー情報を取得するAPI q=以下にキーワード

    // SearchVCで検索キーワードを元にAPIを叩いて値を返す
    func fetchGitHubUsers(searchText: String, completion: @escaping ([GitHubUsers]?, String?) -> Void) {

        AF.request(gitHubAPIURL + searchText) { _ in } .response { response in

            guard let data = response.data else {
                completion(nil, FetchAPIError.someError.title)
                return
            }

            do {
                let json = try JSONDecoder().decode(CodableForGitHubUsers.self, from: data)
                let totalCount = json.totalCount

                guard totalCount > 0 else {
                    completion(nil, FetchAPIError.noResult.title)
                    return
                }

                completion(json.items, nil)

            } catch {
                print(error.localizedDescription)
                completion(nil, FetchAPIError.someError.title)
            }
        }
    }
}
