//
//  Presenter.swift
//  SearchGitHubUsersMVP
//
//  Created by KS on 2021/12/30.
//

import Foundation

protocol PresenterDelegate {
    func passFetchedGitHubUsers(githubUsers: [GitHubUsers])
}

class Presenter {

    private var fetchGitHubUsers = FetchGitHubUsers()
    var delegate: PresenterDelegate?


    func searchBarDidSearch(searchText: String) {
        fetchGitHubUsers.fetchGitHubUsers(searchText: searchText) { gitHubUsers in
            self.delegate?.passFetchedGitHubUsers(githubUsers: gitHubUsers)
            print(gitHubUsers)
        }
    }


}
