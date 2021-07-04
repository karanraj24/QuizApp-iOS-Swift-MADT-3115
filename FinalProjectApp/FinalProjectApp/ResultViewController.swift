//
//  ResultViewController.swift
//  FinalProjectApp
//
//  Created by user200682 on 7/1/21.
//

import UIKit

class ResultViewController: UIViewController {

    var resscore = 0
    
    @IBOutlet weak var completebutton: UIButton!
    @IBOutlet weak var resultbutton: UIButton!
    @IBOutlet weak var msglabel: UILabel!
    @IBOutlet weak var resultscore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultbutton.isHidden = true
        completebutton.isHidden = true

        // Do any additional setup after loading the view.
        resultscore.text = String(resscore)
        let finalscore = resultscore.text
        
        if Int(finalscore!) == 5
        {
            msglabel.text = "You are a Genius!"
            resultbutton.isHidden = true
            completebutton.isHidden = false
        }
        else if Int(finalscore!) == 4
        {
            msglabel.text = "Excellent Work!"
            resultbutton.isHidden = true
            completebutton.isHidden = false
        }
        else if Int(finalscore!) == 3
        {
            msglabel.text = "Good Job!"
            resultbutton.isHidden = true
            completebutton.isHidden = false
        }
        else
        {
            msglabel.text = "Please Try Again!"
            resultbutton.isHidden = false
            completebutton.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
