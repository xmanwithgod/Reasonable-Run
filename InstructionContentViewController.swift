import UIKit
class InstructionContentViewController: UIViewController {
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    var pageIndex: Int?
    var titleText : String!
    var bodyText : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heading.text = self.titleText
        self.bodyTextView.text = self.bodyText
        self.heading.alpha = 0
        self.bodyTextView.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.heading.alpha = 1.0
        })
        UIView.animate(withDuration: 0.75, delay: 0.25, options: [UIView.AnimationOptions.curveEaseInOut], animations: {
            self.bodyTextView.alpha = 1.0
            }, completion: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.heading.alpha = 0.0
        })
        UIView.animate(withDuration: 1, delay: 1, options: [UIView.AnimationOptions.curveEaseInOut], animations: {
            self.bodyTextView.alpha = 0.0
            }, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
