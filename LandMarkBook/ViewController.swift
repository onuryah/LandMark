//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Ceren Çapar on 25.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenImage = UIImage()
    var chosenText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames = [String]()
        landmarkNames.append("Bahcesehir")
        landmarkNames.append("Hacettepe")
        landmarkNames.append("ODTU")
        landmarkNames.append("Yıldız")
        
        landmarkImages.append(UIImage(named: "bahcesehir.jpg")!)
        landmarkImages.append(UIImage(named: "hacettepe.jpg")!)
        landmarkImages.append(UIImage(named: "odtu.jpg")!)
        landmarkImages.append(UIImage(named: "yildiz.jpeg")!)
        
        navigationItem.title = "Landmark Book"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenText = landmarkNames[indexPath.row]
        chosenImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toimageViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toimageViewController"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenText
            destinationVC.selectedLanmarkImage = chosenImage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

}

