//
//  ShoppingTableViewController.swift
//  ShoppingTableViewProject
//
//  Created by 양승혜 on 5/25/24.
//

import UIKit

struct Wish {
    var bought: Bool
    let wantToBuy: String
    var favorite: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = [
        Wish(bought: false, wantToBuy: "애플 키보드", favorite: true),
        Wish(bought: false, wantToBuy: "아이폰15Pro 1TB", favorite: false),
        Wish(bought: true, wantToBuy: "트랙패드", favorite: true),
        Wish(bought: true, wantToBuy: "모니터", favorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        
        backgroundViewUI()
        addButtonUI()
        searchTextfieldUI()
        
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath) as! ShoppingTableViewCell
        
        let data = list[indexPath.row]
        let check = data.bought ? "checkmark.square.fill" : "checkmark.square"
        let star = data.favorite ? "star.fill" : "star"
        
        let checkImage = UIImage(systemName: check)
        let starImage = UIImage(systemName: star)
        
        cell.cellView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        cell.cellView.layer.cornerRadius = 15
        
        cell.wishLabel.text = data.wantToBuy
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.tintColor = .black
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.setImage(starImage, for: .normal)
        cell.favoriteButton.tintColor = .black
        cell.favoriteButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    // Textfield에 띄어쓰기만 써있을 때 걸러내는 구문
    @objc func addButtonClicked(sender: UIButton) {
        guard let text = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty  else {
            return
        }
        list.append(Wish(bought: false, wantToBuy: text, favorite: false))
        searchTextField.text = ""
        tableView.reloadData()
    }
    
    @objc func checkButtonClicked(sender: UIButton) {
        list[sender.tag].bought.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func starButtonClicked(sender: UIButton) {
        list[sender.tag].favorite.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
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
    
    private func searchWithReturnButton() {
        searchTextField.addTarget(self, action: #selector(addButtonClicked), for: UIControl.Event.primaryActionTriggered)
    }
    
    @IBAction func keyBoardDismiss(_ sender: UITextField) {
    }
    
}
