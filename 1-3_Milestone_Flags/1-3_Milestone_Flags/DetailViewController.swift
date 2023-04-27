//
//  DetailViewController.swift
//  1-3_Milestone_Flags
//
//  Created by Paulina Dąbrowska on 27/04/2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage : String?
    var titleText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = titleText
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image, getShareMessage(flag: selectedImage ?? "Unknown")], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func getShareMessage(flag : String) -> String {
        switch flag {
        case "uk" : return "Flag of United Kingdom"
        case "us" : return "Flag of United States"
        default : return "Flag of " + flag.capitalized;
        }
    }
}
