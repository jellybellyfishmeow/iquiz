//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/13/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    var score : Int = 0
    var isCorrect : Bool = false
    var q : String = ""
    var correctAnswer : String = ""
    var num : Int = -1 //now accurate
    var t : Int = -1
    
    var qs : [String] = [] // list of qs
    var answers : [[String]] = [] // list of answers for each
    var correctA : [Int]  = [] // list of correct answers
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var rightOrWrong: UILabel!
    @IBOutlet weak var currScore: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = q
        correct.text = "Correct answer: " + String(correctAnswer)
        if (isCorrect) {
            rightOrWrong.text = "YAY! you got it right!"
            score += 1
        } else {
            rightOrWrong.text = "aw, better luck next time!"
        }
        currScore.text = "Current score: " + String(score)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "backtoQs", sender: self)
    }
    
    
    @IBAction func clickNext(_ sender: Any) {
        if (num == qs.count) {
            performSegue(withIdentifier: "toFinish", sender: nil)
        } else {
            performSegue(withIdentifier: "moreQ", sender: nil)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreQ" {
            let qs: QuestionViewController = segue.destination as! QuestionViewController
            qs.t = self.t
            qs.q = self.qs[num]
            qs.options = answers[num]
            qs.score = self.score
            qs.correct = correctA[num]
            qs.correctA = correctA
            qs.qs = self.qs
            qs.answers = self.answers
            qs.num = self.num
        } else if segue.identifier == "toFinish" {
            let f: FinishViewController = segue.destination as! FinishViewController
            f.score = self.score
            f.total = self.qs.count
        } else {
            let q: ViewController = segue.destination as! ViewController

        }
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
