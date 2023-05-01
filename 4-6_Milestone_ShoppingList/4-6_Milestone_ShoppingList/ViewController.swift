//
//  ViewController.swift
//  4-6_Milestone_ShoppingList
//
//  Created by Paulina Dąbrowska on 01/05/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(showAdditionAlert))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "delete.left"), style: .plain, target: self, action: #selector(deleteAll))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @objc func showAdditionAlert() {
        
        let ac = UIAlertController(title: "Enter item name", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let item = ac?.textFields?[0].text else { return }
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
        let newItem = item.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !newItem.isEmpty {
            items.append(newItem)
            
            let indexPath = IndexPath(row: items.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        } else {
            showErrorMessage("Invalid item name", message: "Your item's name must consist of at least one character")
        }
    }
    
    func showErrorMessage(_ title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func deleteAll() {
        items.removeAll()
        tableView.reloadData()
    }
}

