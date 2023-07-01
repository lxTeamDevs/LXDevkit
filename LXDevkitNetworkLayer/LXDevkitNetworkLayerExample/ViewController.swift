//
//  ViewController.swift
//  LXDevkitNetworkLayerExample
//
//  Created by Artak Gevorgyan on 26.06.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let repo = ExampleRepo()
        repo.fetchArticles { response, error in
            
        }
    }


}

