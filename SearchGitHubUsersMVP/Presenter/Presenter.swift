//
//  Presenter.swift
//  SearchGitHubUsersMVP
//
//  Created by KS on 2021/12/30.
//

import Foundation

protocol PresenterDelegate {
    func passFetchedGitHubUsers(githubUsers: [GitHubUsers])
    func passFetchGitHubUsersAlert(errorString: String)
}

class Presenter {

    private var fetchGitHubUsers = FetchGitHubUsers()
    var delegate: PresenterDelegate?


    func searchBarDidSearch(searchText: String) {
        fetchGitHubUsers.fetchGitHubUsers(searchText: searchText) { gitHubUsers, error  in

            if let error = error {
                self.delegate?.passFetchGitHubUsersAlert(errorString: error)
            }

            if let gitHubUsers = gitHubUsers {
                self.delegate?.passFetchedGitHubUsers(githubUsers: gitHubUsers)
            }
        }
    }


}
