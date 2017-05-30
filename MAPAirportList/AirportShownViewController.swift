//
//  AirportShownViewController.swift
//  MAPAirportList
//
//  Created by Salim Fang on 2017/5/30.
//  Copyright © 2017年 Salim. All rights reserved.
//

import UIKit

class AirportShownViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadPlist() ->[[String:String]]{
        let path = Bundle.main.path(forResource: "airports", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }

    
    @IBOutlet weak var airportName: UILabel!
    @IBOutlet weak var airportCountry: UILabel!
    @IBOutlet weak var airportCity: UILabel!
    @IBOutlet weak var airportImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let airportList = loadPlist()
        self.title = airportList[selectedIndex]["IATA"]
        airportName.text = airportList[selectedIndex]["Airport"]
        airportCountry.text = airportList[selectedIndex]["Country"]
        airportCity.text = airportList[selectedIndex]["ServedCity"]
        airportImage.image = UIImage(named: airportList[selectedIndex]["IATA"]!+".jpg")


    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
