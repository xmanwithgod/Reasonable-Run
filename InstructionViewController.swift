import UIKit
class InstructionViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    @IBOutlet weak var closeButton: UIBarButtonItem!
    let instructions = [
        (title: "", body: "Reasonable Run will tell you how fast you need to run 100 meters in a minute, how long it will take you to run 10 miles at your current pace, or how far you can run in a given amount of time."),
        (title: "How fast will I run?", body: "Figure out your pace based on a specified time and distance."),
        (title: "How long will it take me?", body: "Figure out your running duration based on a specified pace and distance."),
        (title: "How far will I go?", body: "Figure out a distance based on a specific pace and running duration."),
        (title: "Why don't you start exercising now??", body: "We will help you count, help you count, and help you complete the movement you want to complete."),
    ]
    var pageViewController: UIPageViewController!
    func reset() {
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        let pageContentViewController = self.viewControllerAtIndex(index: 0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        self.addChild(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMove(toParent: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func closeView(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func close(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! InstructionContentViewController).pageIndex!
        if(index <= 0){
            return nil
        }
        index-=1
        return self.viewControllerAtIndex(index: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! InstructionContentViewController).pageIndex!
        index+=1
        if(index >= self.instructions.count){
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    func viewControllerAtIndex(index : Int) -> UIViewController? {
        if((self.instructions.count == 0) || (index >= self.instructions.count)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "InstructionContentViewController") as! InstructionContentViewController
        pageContentViewController.titleText = self.instructions[index].title
        pageContentViewController.bodyText = self.instructions[index].body
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.instructions.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
