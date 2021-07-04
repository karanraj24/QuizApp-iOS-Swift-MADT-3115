//
//  QuestionViewController.swift
//  FinalProjectApp
//
//  Created by user200682 on 7/1/21.
//

import UIKit

class QuestionViewController: UIViewController {
    
    let Questions = ["What is used to create mutable object ?",
                     "Which Of The Following Is Incorrect Value Type Of The Swift ?",
                     "Which IDE is used in Swift ?",
                     "We use the keyword ............ to create contants in swift.",
                     "Which Of The Following Declares A Mutable Array In Swift ?",
                     "............ keyword in swift used to initialize the variable ?",
                     "Which are the control transfer statements used in Swift ?",
                     "Which Of The Following Is Incorrect Data Type In SWIFT ?",
                     "What are the advantages of Swift ?",
                     "How many Types of collection in Swift are:"]
    let Answers = [["Var","Let","Both","None"],
                   ["Class","Enum","Double","Character"],
                   ["Xcode","Ld","Gas","Swiftc"],
                   ["Let","Var","Conts","Constant"],
                   ["Var X=[Int]()","Let X=[Int]()","Var X=[Int]","Let X=[Int]"],
                   ["nil","null","NIL","NULL"],
                   ["All","Break","Continue","Fallthrough"],
                   ["Char","Int","Double","Optional"],
                   ["All","Safe","Fast","Open-Source"],
                   ["Arraay-Dictionary","Dictionary-Library","Array-Library","All"]]

    @IBOutlet weak var questiontext: UITextView!
    @IBOutlet weak var result: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option1: UIButton!
    
    var RandomSet = Set<String>()
    var RandomIndexArray = Set<Int>()
    var currentQuestion = 0
    var Score = 0
    var rightAnswer:UInt32 = 0
    var resultArray = [String]()
    var AnswerArray = [[String]]()
    var indexArray = [Int]()
    
    
    var defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Score = 0
        // Do any additional setup after loading the view.
        option1.layer.cornerRadius = 10
        option2.layer.cornerRadius = 10
        option3.layer.cornerRadius = 10
        option4.layer.cornerRadius = 10
        
        while RandomSet.count < 5 {
            let RandomIndex = Int(arc4random_uniform(UInt32(Questions.count)))
            RandomSet.insert(Questions[RandomIndex])
            RandomIndexArray.insert(RandomIndex)
        }
        indexArray = Array(RandomIndexArray)
        
        for i in indexArray
        {
            resultArray.append(Questions[i])
            AnswerArray.append(Answers[i])
        }
        //print("Randomly Selected Questions: ",resultArray)
        //print("Answers options for randomly selected Questions Respectively: ",AnswerArray)
    }

    override func viewWillAppear(_ animated: Bool) {
        Score = 0
        nextQuestion()
    }
    
    @IBAction func Answerbutton(_ sender: UIButton) {
        
        if sender.tag == Int(rightAnswer)
        {
            Score += 1
            //print("Current Score: ",Score)
        }
        if currentQuestion != indexArray.count
        {
            nextQuestion()
        }
        else{
            questiontext.text = ""
            option1.isHidden = true
            option2.isHidden = true
            option3.isHidden = true
            option4.isHidden = true
            result.isHidden = false
        }
    }
    
    func nextQuestion()
    {
        result.isHidden = true
        questiontext.text = resultArray[currentQuestion]
        
        rightAnswer = arc4random_uniform(4) + 1
        
        var button = UIButton()
        
        var x = 1
        
        for i in 1...4
        {
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswer)
            {
                button.setTitle(AnswerArray[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(AnswerArray[currentQuestion][x], for: .normal)
                x = x+1
            }
        }
        currentQuestion += 1
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let pvc = segue.destination as? ResultViewController
        // Pass the selected object to the new view controller.
        pvc?.resscore = Score
    }
    

}
