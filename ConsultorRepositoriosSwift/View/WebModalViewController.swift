import UIKit
import WebKit
import NVActivityIndicatorView

class WebModalViewController: UIViewController {
    
    let loading = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .orange, padding: 0)
    var urlWebView:URL!
    var webView = WKWebView()
    
    init (urlWebView: URL!){
        self.urlWebView = urlWebView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loading(animate: true)
        self.webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        loading(animate: true)
       
        view.addSubview(webView)
        let url = urlWebView
        
        if let value = url{
            loading(animate: false)
            self.webView.load(URLRequest(url: value))
            self.webView.allowsBackForwardNavigationGestures = true
            navigationController?.navigationBar.isHidden = true
        }else{
            print("Não foi possivel receber o url da Pull Request selecionada.")
        }
    }
    
    func loading(animate: Bool){
        
        loading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            loading.widthAnchor.constraint(equalToConstant: 40),
            loading.heightAnchor.constraint(equalToConstant: 40),
            
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        if !animate{
            loading.stopAnimating()
        }else{
            loading.startAnimating()
        }
    }
}
