import UIKit

class ViewController: UIViewController {
    
    var questionIndex:Int = 0
    var score:Int = 0
    var answerChosen: Bool = false
    var questions = QuestionBank()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            answerChosen = true
        }
        else {
            answerChosen = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        questionLabel.text = questions.list[questionIndex].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIndex+1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionIndex+1)
    }
    

    func nextQuestion() {
        if questionIndex < 12 {
            questionIndex += 1
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "Quiz Complete", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in self.startOver()})
            
            alert.addAction(alertAction)

            self.present(alert, animated: true)
        }
    }
    
    
    func checkAnswer() {
        if answerChosen == questions.list[questionIndex].questionAnswer {
            //print("You got it")
            score += 1
            ProgressHUD.showSuccess("Correct")
        }
        else {
            //print("Wrong")
            ProgressHUD.showError("Wrong")
        }
        
        //nextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nextQuestion()
        }
    }
    
    
    func startOver() {
        //print("Over \(questionIndex)")
        questionIndex = 0
        updateUI()
    }
    

    
}
