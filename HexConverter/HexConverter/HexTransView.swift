//
//  HexTransView.swift
//  HexConverter
//
//  Created by lip on 17/1/11.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class HexTransView: UIView {
    
    // 定义数组
    var binaryRes:String = "--"
    var octalRes:String = "--"
    var decimalRes:String = "--"
    var sixteenRes:String = "--"
    
    // 定义控件
    var backgroundView:UIView? = nil
    var textField:UITextField? = nil
    var resultLabel:UILabel? = nil
    var tableView:UITableView? = nil

    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        initUI()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

// MARK: - UI相关方法
extension HexTransView{
    
    fileprivate func initUI(){
        backgroundView = UIView()
        textField = UITextField()
        resultLabel = UILabel()
        tableView = UITableView()
    }
    
    fileprivate func setupUI(){
        
        guard let backgroundView = backgroundView,
            let textField = textField,
            let resultLabel = resultLabel,
            let tableView = tableView else{
            return
        }
        
        // backgroudView
        backgroundView.backgroundColor = UIColor.white
        addSubview(backgroundView)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addConstraint(NSLayoutConstraint(item: backgroundView,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: UIScreen.main.bounds.width))
        
        backgroundView.addConstraint(NSLayoutConstraint(item: backgroundView,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 44))
        
        addConstraint(NSLayoutConstraint(item: backgroundView,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .top,
                                         multiplier: 1.0,
                                         constant: 0))
        
        // textField
        textField.placeholder = "请在此输入数据"
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.delegate = self
        backgroundView.addSubview(textField)
        textField.addTarget(self, action: #selector(textFieldValueChange(tf:)), for: .allEditingEvents)
        
        textField.translatesAutoresizingMaskIntoConstraints  = false
        backgroundView.addConstraint(NSLayoutConstraint(item: textField,
                                                        attribute: .centerY,
                                                        relatedBy: .equal,
                                                        toItem: backgroundView,
                                                        attribute: .centerY,
                                                        multiplier: 1.0,
                                                        constant: 0))
        
        backgroundView.addConstraint(NSLayoutConstraint(item: textField,
                                                        attribute: .left,
                                                        relatedBy: .equal,
                                                        toItem: backgroundView,
                                                        attribute: .left,
                                                        multiplier: 1.0,
                                                        constant: 10))
        
        backgroundView.addConstraint(NSLayoutConstraint(item: textField,
                                                        attribute: .right,
                                                        relatedBy: .equal,
                                                        toItem: backgroundView,
                                                        attribute: .right,
                                                        multiplier: 1.0,
                                                        constant: -10))
        
        // resultLabel
        resultLabel.text = "转换结果"
        resultLabel.textColor = #colorLiteral(red: 0.5592800975, green: 0.5637370944, blue: 0.5852575302, alpha: 1)
        resultLabel.font = UIFont.boldSystemFont(ofSize: 13)
        addSubview(resultLabel)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: resultLabel,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: backgroundView,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 24))
        
        addConstraint(NSLayoutConstraint(item: resultLabel,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 12))
        
        // tableView
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: tableView,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: resultLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 12))
        
        tableView.addConstraint(NSLayoutConstraint(item: tableView,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: UIScreen.main.bounds.width))
        
        tableView.addConstraint(NSLayoutConstraint(item: tableView,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 44*4))
        
        
    }
}

// MARK: - 代理方法
extension HexTransView:UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    
    
    // FIXME: -复制粘贴可以非法输入
    /// textField 代理方法
    ///
    /// - Parameters:
    ///   - textField: 当前输入框，可获取已输入信息
    ///   - range: 范围（没用到所以没有深纠）
    ///   - string: 当前输入的那个字符
    /// - Returns: true允许输入，false不允许输入
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 子类根据自己需要重写即可
        return false
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cellId")
        var title = "二进制"
        var detail = "--"
        switch indexPath.row {
        case 0:
            detail = binaryRes
            break
        case 1:
            detail = octalRes
            title = "八进制"
            break
        case 2:
            detail = decimalRes
            title = "十进制"
            break
        case 3:
            detail = sixteenRes
            title = "十六进制"
            break
        default:
            title = "二进制"
        }
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = detail
        
        
        return cell;
    }

}

// MARK: - 监听方法
extension HexTransView{
    
    @objc  func textFieldValueChange(tf:UITextField){
        
        // 子类重写此方法
        textField?.text == "" ? cleanLabel() : ()
    }
    
    func cleanLabel(){
        sixteenRes = "--"
        octalRes = "--"
        decimalRes = "--"
        binaryRes = "--"
        tableView?.reloadData()
    }
    
}
