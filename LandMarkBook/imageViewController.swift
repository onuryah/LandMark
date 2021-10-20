//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by Ceren Çapar on 26.09.2021.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    var selectedLandmarkName = ""
    var selectedLanmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelText.text = selectedLandmarkName
        imageView.image = selectedLanmarkImage
        
    }
    


}
