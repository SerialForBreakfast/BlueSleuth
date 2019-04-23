//
//  ViewController.swift
//  BlueSleuth
//
//  Created by Joseph McCraw on 4/23/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import UIKit
import CoreBluetooth


class BTListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate {
    var names : [String] = []
    var RSSIs : [NSNumber] = []

    @IBAction func refreshTapped(_ sender: Any) {
        startScan()
    }
    @IBOutlet var tableView: UITableView!
    
    var centralManager : CBCentralManager?
    
    
    func startScan() {
        
        names = []
        RSSIs = []
        tableView.reloadData()
        centralManager?.stopScan()
        centralManager?.scanForPeripherals(withServices: nil, options: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
//    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
//        <#code#>
//    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("central manager did discover\(String(describing: peripheral.name))")
        
        if let name = peripheral.name {
            print("Peripheral name: \(name)")
            print("UUID: \(peripheral.identifier.uuidString)")
            print("RSSI: \(RSSI)")
            print("Ad Data: \(advertisementData)")
            names.append(name)
        } else {
            names.append(peripheral.identifier.uuidString)
        }
        RSSIs.append(RSSI)
        tableView.reloadData()
    }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        if central.state == .poweredOn {
            print(central.state)
            startScan()
        } else {
            let alertVC = UIAlertController(title: "Bluetooth is not on", message: "Ensure your Bluetooth is enabled", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler:{ (action)
                in
                alertVC.dismiss(animated: true, completion: nil)
                
            })
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
            
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BTCell", for: indexPath) as? BTTableViewCell {
            //Dummy data
            cell.nameLabel.text = names[indexPath.row]
            cell.RSSILabel.text = "RSSI: \(RSSIs[indexPath.row])"
            return cell
        }
        //This should never be called
        return UITableViewCell()
    }
}

