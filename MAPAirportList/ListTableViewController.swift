//
//  ListTableViewController.swift
//  MAPAirportList
//
//  Created by Salim Fang on 2017/5/26.
//  Copyright © 2017年 Salim. All rights reserved.
//

import UIKit


var selectedIndex = 0

class ListTableViewController: UITableViewController {

    func loadPlist() ->[[String:String]]{
        let path = Bundle.main.path(forResource: "airports", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }
    
    

    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
/*
        let airportList = loadPlist()
        var countryList: Set<String> = ["Germany"]
        
        for country in airportList {
            countryList.insert(country["Country"]!)
        }
        
        return countryList.count
 */
        return 1
    }

    /*
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->String {
        
        let airportList = loadPlist()
        var countryList: Set<String> = ["Germany"]
        
        for country in airportList {
            countryList.insert(country["Country"]!)
        }
        
        let countryArray = Array(countryList)
        
        return countryArray[section]
        
    }
 
 */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let airportListCount = loadPlist()
        return airportListCount.count
        
    }

    
    @IBOutlet weak var airportNameShown: UILabel!

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath)
        
        let airportList = loadPlist()
        cell.textLabel?.text = airportList[indexPath.row]["Airport"]
        cell.detailTextLabel?.text = airportList[indexPath.row]["IATA"]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
