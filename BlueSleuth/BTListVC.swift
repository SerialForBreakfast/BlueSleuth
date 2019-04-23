//
//  ViewController.swift
//  BlueSleuth
//
//  Created by Joseph McCraw on 4/23/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import UIKit

class BTListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func refreshTapped(_ sender: Any) {
        
    }
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BTCell", for: indexPath) as? BTTableViewCell {
            //Dummy data
            cell.nameLabel.text = "This is a test"
            cell.RSSILabel.text = "RSSI = 00000"
            return cell
        }
        //This should never be called
        return UITableViewCell()
    }
}

