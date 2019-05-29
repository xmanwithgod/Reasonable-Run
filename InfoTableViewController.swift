import UIKit
import MessageUI
import Social
class InfoTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var contactTableCell: UITableViewCell!
    @IBOutlet weak var rateTableCell: UITableViewCell!
    @IBOutlet weak var privacyTableCell: UITableViewCell!
    @IBAction func closeView(sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = Colors.Tint
        self.tableView.separatorColor = Colors.Tint
        self.tableView.tableFooterView = footerView
        footerView.frame.size.height = self.tableView.frame.size.height - (self.navigationController?.navigationBar.frame.size.height)! - self.tableView.tableFooterView!.frame.origin.y
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let selectedCell: UITableViewCell = self.tableView.cellForRow(at: indexPath)!
        if selectedCell == contactTableCell {
            sendSupportEmail()
        } else if selectedCell == rateTableCell {
            rateApp()
        }
    }
    private func sendSupportEmail() {
        let composer: MFMailComposeViewController = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail() {
            composer.setToRecipients(["jsonkeny@gmail.com"])
            composer.setSubject("Feedback")
            composer.setMessageBody("This is the body", isHTML: false)
            composer.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(composer, animated: true, completion: nil)
        }
    }
    private func rateApp() {
        let appURL = "itms-apps://itunes.apple.com/app/id991569264"
        UIApplication.shared.openURL(NSURL(string: appURL)! as URL)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if (error != nil) {
            let alert:UIAlertController = UIAlertController(title: "Error", message: "Oops: \(error!)", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
