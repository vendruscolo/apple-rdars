//
//  ViewController.swift
//  Edit Actions invisible buttons
//
//  Created by Alessandro Vendruscolo on 08/10/2019.
//  Copyright © 2019 AVEdesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button test", style: .plain, target: nil, action: nil)
    }

    @IBAction func share(_ sender: Any) {
        let anURL = URL(string: "http://example.com")!
        let activityVC = UIActivityViewController(activityItems: [anURL], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}

