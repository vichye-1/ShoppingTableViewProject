//
//  ShoppingTableViewController.swift
//  ShoppingTableViewProject
//
//  Created by 양승혜 on 5/25/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundViewUI()
        addButtonUI()
        searchTextfieldUI()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }
    
    private func backgroundViewUI() {
        backgroundView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        backgroundView.layer.cornerRadius = 15
    }
    
    private func addButtonUI() {
        addButton.backgroundColor = .lightGray.withAlphaComponent(0.3)
        addButton.layer.cornerRadius = 7
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.setTitleColor(.gray, for: .highlighted)
    }
    
    private func searchTextfieldUI() {
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        searchTextField.placeholder = "무엇을 구매하실 건가요?"
    }
}
