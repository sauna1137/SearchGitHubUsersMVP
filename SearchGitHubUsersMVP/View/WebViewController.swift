//
//  WebViewController.swift
//  SearchGitHubUsersMVP
//
//  Created by KS on 2021/12/30.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlForRequest = URL(string: url)
        let request = URLRequest(url: urlForRequest!)
        webView.load(request)
    }

}
