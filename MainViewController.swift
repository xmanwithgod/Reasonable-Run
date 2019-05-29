import UIKit
class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.black.withAlphaComponent(0.75)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var durationButton: CustomDefaultButton!
    @IBOutlet weak var distanceButton: CustomDefaultButton!
    @IBOutlet weak var rateButton: CustomDefaultButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let inputsVC = segue.destination as? InputsViewController {
            if segue.identifier == "durationSegue" {
                inputsVC.titleSaying = (self.durationButton.titleLabel?.text)!
                inputsVC.willHideDuration = true
                inputsVC.willHidePace     = false
                inputsVC.willHideDistance = false
            } else if segue.identifier == "distanceSegue" {
                inputsVC.titleSaying = (self.distanceButton.titleLabel?.text)!
                inputsVC.willHideDistance = true
                inputsVC.willHideDuration = false
                inputsVC.willHidePace     = false
            } else if segue.identifier == "rateSegue" {
                inputsVC.titleSaying = (self.rateButton.titleLabel?.text)!
                inputsVC.willHidePace     = true
                inputsVC.willHideDistance = false
                inputsVC.willHideDuration = false
            }
        }
    }
}
