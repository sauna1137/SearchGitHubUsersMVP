//
//  ViewController.swift
//  SearchGitHubUsersMVP
//
//  Created by KS on 2021/12/30.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private var presenter = Presenter()
    private var gitHubUsers: [GitHubUsers] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        presenter.delegate = self

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.imageVIew.sd_setImage(with: URL(string: gitHubUsers[indexPath.row].avatarURL), completed: nil)
        cell.nameLabel.text = gitHubUsers[indexPath.row].login
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebVC") as! WebViewController
        webVC.url = gitHubUsers[indexPath.row].htmlURL
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(webVC, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchBarDidSearch(searchText: searchBar.text ?? "")
    }
}

extension ViewController: PresenterDelegate {
    func passFetchedGitHubUsers(githubUsers: [GitHubUsers]) {
        gitHubUsers = githubUsers
        tableView.reloadData()
    }
}
