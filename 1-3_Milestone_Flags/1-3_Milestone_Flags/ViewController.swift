//
//  ViewController.swift
//  1-3_Milestone_Flags
//
//  Created by Paulina Dąbrowska on 27/04/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        flags = flags.sorted()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = getDisplayName(flag: flags[indexPath.row])
        
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        cell.imageView?.layer.borderWidth = 0.5
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            vc.titleText = "Flag of \(getDisplayName(flag: flags[indexPath.row]))"
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func getDisplayName(flag : String) -> String {
        switch flag {
        case "uk" : return "United Kingdom"
        case "us" : return "United States"
        default : return flag.capitalized;
        }
    }
}

