//
//  ViewController.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
    private var schoolList = [SchoolData]() //["1", "2", "3"];
    private var schoolViewModel : SchoolViewModal!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "School List"
        setupViewModal()
    }

    func setupViewModal(){
        self.schoolViewModel =  SchoolViewModal()
        
        // download data in background thread
        DispatchQueue.global().async {
            
            self.schoolViewModel.getSchoolFromURL(completion: {
                (modalArray:[SchoolData]) in
                  
                self.schoolList = modalArray
            
                // update tableview in main thread here
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
            })
        }
    }

}

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // school name
        let school = schoolList[indexPath.row] as SchoolData
        
        cell.textLabel?.text = school.school_name

        // subtitle
        cell.detailTextLabel?.text = school.location
        
        return cell
  }
}

extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let school = schoolList[indexPath.row] as SchoolData
        vc.school = school
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

