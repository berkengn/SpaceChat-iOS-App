
import UIKit
import Firebase
import AVKit
import AVFoundation

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet var registerView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "space", ofType: "mp4")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        //videoGravity value is for how to display the video in given layer bounds.
        //In this case we stretch the video to full size while preserving its aspect ratio.
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
        
        registerView.bringSubviewToFront(registerButton)
        registerView.bringSubviewToFront(emailView)
        registerView.bringSubviewToFront(passwordView)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.popUpID) as! PopUpViewController
                    popOverVC.error = e.localizedDescription
                    self.addChild(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParent: self)
                    
                }else {
                    //Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
        
    }
    
}
