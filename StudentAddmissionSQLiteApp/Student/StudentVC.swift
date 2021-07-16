//
//  StudentVC.swift
//  StudentAddmissionSQLiteApp
//
//  Created by Kevin on 16/07/21.
//

import UIKit

class StudentVC: UIViewController {

    let spid = UserDefaults.standard.string(forKey: "spid")
    let name = UserDefaults.standard.string(forKey: "name")
    let clas = UserDefaults.standard.string(forKey: "clas")
    let div = UserDefaults.standard.string(forKey: "div")
    let sem = UserDefaults.standard.string(forKey: "sem")
    let mobileno = UserDefaults.standard.string(forKey: "mobileno")
    private var studArray = [Students]()
    private var noticeArray = [Notice]()
    
    private let welcomelbl:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    private let classLabelName:UILabel = {
        let label = UILabel()
        label.text = "Your Class"
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    private let classLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    

    private let divLabelName:UILabel = {
        let label = UILabel()
        label.text = "Your Div"
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    private let divLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    private let semLableName:UILabel = {
        let label = UILabel()
        label.text = "Your Sem"
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    private let SemLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    private let noticeLabelName:UILabel = {
        let label = UILabel()
        label.text = "Notice"
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    
    
    private let noticeLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "", size: 40.0)
        label.textAlignment = .center
        label.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        label.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    private let allNotice:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(gotonotice), for: .touchUpInside)
        button.setImage(UIImage(named: "noticeboard"),for: .normal)
        return button
    }()
    
    @objc private func gotonotice(){
        
        let vc = studNoticeVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }

    private let icontext:UILabel = {
        let labl = UILabel()
        labl.text = "Check All Notice"
        labl.font = UIFont(name: "", size: 10.0)
        labl.textAlignment = .center
        labl.textColor = .white
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    private let changepwd : UIButton = {
        let con = UIButton()
        
        con.setTitle("Change Password", for: .normal)
        con.addTarget(self, action: #selector(changepassword), for: .touchUpInside)
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        con.backgroundColor = .systemGreen
        return con
        
        
    } ()
    
    private let logout : UIButton = {
        let con = UIButton()
        
        con.setTitle("Logout", for: .normal)
        con.addTarget(self, action: #selector(gotohome), for: .touchUpInside)
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
       
        con.backgroundColor = .systemGreen
        return con
        
        
    } ()
    
    @objc private func gotohome(){
        
        let vc =  ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func changepassword()
    {
        let cnt = studArray.count
        for i in 0..<cnt
        {
            if (spid == studArray[i].spid)
            {
                let sid = Int(self.studArray[i].id)
                let sname = self.studArray[i].name
                let sclas = self.studArray[i].clas
                let sdiv = self.studArray[i].div
                let ssem = self.studArray[i].sem
                let smobile = self.studArray[i].mobileno
                let sspid = self.studArray[i].spid
                
                
                
                let alert = UIAlertController(title: "Add New Password", message: "Please Change Your Password", preferredStyle: .alert)
                
                alert.addTextField { (tf) in
                    tf.text = "\(self.studArray[i].password)"
                }
                let action = UIAlertAction(title:"Submit", style: .default) { (_) in
                    guard let pwd = alert.textFields?[0].text
                        else{
                            return
                    }
                    let stud = Students(id: sid, spid:sspid , name:sname, clas: sclas, div: sdiv, sem: ssem, mobileno: smobile, password: pwd )
                    SQLiteHandler.shared.updatepwd(stud: stud) { [weak self] success in
                        if success
                        {
                            let alert = UIAlertController(title: "Updated Succesfully", message: "Success !", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel,handler: { [weak self] _ in
                                let vc = StudentVC()
                                self?.navigationController?.pushViewController(vc, animated: false)
                                
                            }))
                            DispatchQueue.main.async
                                {
                                    self!.present(alert, animated: true, completion: nil)
                            }
                            
                        }
                        else
                        {
                            let alert = UIAlertController(title: "Oops", message: "There Was An Error !", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel))
                            DispatchQueue.main.async
                                {
                                    self!.present(alert, animated: true, completion: nil)
                            }
                            
                        }
                    }//sqlhandler
                }//let action
                alert.addAction(action)
                
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        studArray = SQLiteHandler.shared.fetch()
        noticeArray = SQLiteNoticeHandler.shared.fetch()
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        view.addSubview(welcomelbl)
        view.addSubview(classLabelName)
        view.addSubview(classLabel)
        view.addSubview(divLabelName)
        view.addSubview(divLabel)
        view.addSubview(semLableName)
        view.addSubview(SemLabel)
        view.addSubview(allNotice)
        view.addSubview(icontext)
        view.addSubview(changepwd)
        view.addSubview(logout)
        print(name!)
        print(div!)
        print(spid!)
        welcomelbl.text = "Welcome :\(name!)"
        classLabel.text = clas
        divLabel.text = div
        SemLabel.text = sem
        let ntcnt = noticeArray.count
        for i in 0..<ntcnt
        {
            noticeLabel.text = noticeArray[i].notice
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        welcomelbl.frame = CGRect(x: 80, y: 130, width: 225, height: 60)
        classLabelName.frame = CGRect(x: 80, y: welcomelbl.bottom + 5, width: 120, height: 40)
        classLabel.frame = CGRect(x: classLabelName.right + 10, y: welcomelbl.bottom + 5, width: 100, height: 40)
        divLabelName.frame = CGRect(x: 80, y: classLabelName.bottom + 5, width: 120, height: 40)
        divLabel.frame = CGRect(x: divLabelName.right + 10, y: classLabelName.bottom + 5, width: 100, height: 40)
        semLableName.frame = CGRect(x: 80, y: divLabelName.bottom + 5, width: 120, height: 40)
        SemLabel.frame = CGRect(x: semLableName.right + 10, y: divLabelName.bottom + 5, width: 100, height: 40)
        allNotice.frame = CGRect(x: 150, y: semLableName.bottom + 50, width: 100, height: 100)
        icontext.frame = CGRect(x: 120, y: allNotice.bottom + 2, width: 150, height: 20)
        changepwd.frame = CGRect(x: 100, y: icontext.bottom + 20, width: view.width / 2, height: 50)
        logout.frame = CGRect(x: 100, y: changepwd.bottom + 20, width: view.width / 2, height: 30)
    }
    
    
    
    
}
