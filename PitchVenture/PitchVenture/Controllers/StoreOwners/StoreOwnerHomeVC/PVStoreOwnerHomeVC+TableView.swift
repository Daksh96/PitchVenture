//
//  PVStoreOwnerHomeVC+TableView.swift
//  PitchVenture
//
//  Created by Harshit on 19/11/21.
//  Copyright © 2021 PitchVenture. All rights reserved.
//

import Foundation
import UIKit

extension PVStoreOwnerHomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrFranchises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PVHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: PVHomeTableViewCell.reuseIdentifier()) as! PVHomeTableViewCell
        
        if let isFranchise = self.arrFranchises[indexPath.row].isFranchise, isFranchise {
            cell.btnFranchise.isHidden = true
        } else {
            cell.btnFranchise.isHidden = false
            cell.btnFranchise.setTitle("Apply", for: .normal)
            cell.btnFranchise.tag = indexPath.row
            cell.btnFranchise.addTarget(self, action: #selector(btnApplyAction), for: .touchUpInside)
        }
        cell.configureStoreOwnerCell(account: self.arrFranchises[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let obj = PVFranchiseDetailVC.instantiate()
//        obj.account = self.arrFranchises[indexPath.row]
//        self.push(vc: obj)
    }
    
    @objc func btnApplyAction(sender: UIButton) {

        let alert = UIAlertController(title: "Send Request", message: "Are you sure you want to send request for connect?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (_) in
            //SEND REQUEST
            self.callSendRequest(user: self.arrFranchises[sender.tag])
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
