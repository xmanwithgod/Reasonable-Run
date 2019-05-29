import UIKit
class PrivacyViewController: UIViewController {
    @IBOutlet weak var mainWebview: UIWebView!
    @IBAction func ActionS(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let PrivacyHtml = try! String(contentsOfFile: Bundle.main.path(forResource: "Provicy", ofType: "html")!, encoding: String.Encoding.utf8)
        mainWebview.loadHTMLString(PrivacyHtml, baseURL: URL.init(fileURLWithPath: "/Users/summer/Desktop/ReasonableRun/ReasonableRun/Provicy.html") )
        self.ActionS50MkRWerun("privacyO", self)
    }
}
