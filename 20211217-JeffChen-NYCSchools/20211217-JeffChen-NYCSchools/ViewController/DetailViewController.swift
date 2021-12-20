//
//  DetailViewController.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/18/21.
//

import UIKit

class DetailViewController: UIViewController {

    var school : SchoolData?
    var schoolDBN: String?
    
    @IBOutlet weak var scoreMath: UILabel!
    @IBOutlet weak var scoreReading: UILabel!
    @IBOutlet weak var scoreWriting: UILabel!
    
    private var schoolViewModel : SchoolViewModal!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = school?.school_name //?["school_name"] as? String
        
        schoolDBN = school?.dbn //?["dbn"] as? String
        
        setupViewModal()
    }
    
    func setupViewModal(){
        self.schoolViewModel =  SchoolViewModal()
        self.schoolViewModel.getScoreFromURL(completion: {
            (dataArray:[SchoolScore]) in
            
            if let dataArray = dataArray as? [SchoolScore] {
            
                // search school one by one
                for mySchool in dataArray {
                    
                    let dbn = mySchool.dbn as? String
                    
                    if(self.schoolDBN == dbn ) {
                        DispatchQueue.main.async {
                            self.scoreMath.text = mySchool.sat_math_avg_score as? String
                            self.scoreReading.text = mySchool.sat_critical_reading_avg_score as? String
                            self.scoreWriting.text = mySchool.sat_writing_avg_score as? String
                        }
                    }
                }
            }
        })
    }
}
