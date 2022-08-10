//
//  ViewController.swift
//  ios-main
//
//  Created by Marco on 26/4/2019.
//  Copyright © 2019 Marco. All rights reserved.
//

import UIKit
class ViewController: UITableViewController {
    
	override func viewDidLoad() {
		super.viewDidLoad()
//        PermutiveManager.testTracker()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 100
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
        cell.textLabel?.text = String(indexPath.row)
        return cell
	}
}
