//
//  ViewController+tableView.swift
//  SerasaTest
//
//  Created by marcos hayashi on 26/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumbersOfLineTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.makeTableViewCell(tableView: tableView, indexPath: indexPath)
    }
    
    
}
