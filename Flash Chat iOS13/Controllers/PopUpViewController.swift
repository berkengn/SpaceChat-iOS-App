
import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    var error: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        errorLabel.text = error
        errorView.layer.cornerRadius = errorView.frame.size.height / 5
        
    }
    @IBAction func closeButton(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
}
