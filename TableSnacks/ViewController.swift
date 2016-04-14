//
//  ViewController.swift
//  TableSnacks
//
//  Created by Monica Mollica on 2016-04-14.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var navBarViewHeight: NSLayoutConstraint!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var stackView = UIStackView(frame: CGRectZero)
    var foods = [String]()
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarViewHeight.constant = 84
        
        stackViewSetup()
        
        addLabel("SNACKS")
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return foods.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foodCell", forIndexPath: indexPath) as! FoodTableViewCell
        
        let food = foods[indexPath.row]
        cell.foodLabel.text = food
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            foods.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            //
        }
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //
//    }
    
    // MARK: Actions
    
    @IBAction func addFoodButtonPressed(sender: AnyObject) {
        if navBarViewHeight.constant == 84 {
            openMenu()
            
            UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.view.layoutIfNeeded()
                self.foodButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/2))
            }) { (finished) in
                //
            }
            
        } else if navBarViewHeight.constant == 200 {
            closeMenu()
            UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.view.layoutIfNeeded()
                self.foodButton.transform = CGAffineTransformMakeRotation(CGFloat(0))
            }) { (finished) in
                //
            }
        }
    }
    
    // MARK: Helper Functions
    
    func openMenu() {
        navBarViewHeight.constant = 200
        self.stackView.hidden = false
    }
    
    func closeMenu() {
        navBarViewHeight.constant = 84
        self.stackView.hidden = true
    }
    
    func stackViewSetup() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        navBarView.addSubview(stackView)
        
        
        stackView.leftAnchor.constraintEqualToAnchor(navBarView.leftAnchor).active = true
        stackView.bottomAnchor.constraintEqualToAnchor(navBarView.bottomAnchor).active = true
        stackView.widthAnchor.constraintEqualToAnchor(navBarView.widthAnchor).active = true
        stackView.heightAnchor.constraintEqualToConstant(200 - 84).active = true
        
        let spacing = CGFloat(5)
        let width = CGFloat((Int(self.view.frame.size.width) - (Int(spacing) * 6)) / 5)
        let height = CGFloat(200 - 84 - (Int(spacing) * 2))
        
        let oreoView = StringImageView(frame: CGRectZero)
        oreoView.nameString = "Oreos"
        oreoView.image = UIImage(named: "oreos")
        addTapGesture(oreoView)
        stackView.addSubview(oreoView)
        view.addConstraint(NSLayoutConstraint(item: oreoView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: stackView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: oreoView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: stackView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: oreoView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width))
        view.addConstraint(NSLayoutConstraint(item: oreoView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height))
        
        let pizzaView = StringImageView(frame: CGRectZero)
        pizzaView.nameString = "Pizza Pockets"
        pizzaView.image = UIImage(named: "pizza_pockets")
        addTapGesture(pizzaView)
        stackView.addSubview(pizzaView)
        view.addConstraint(NSLayoutConstraint(item: pizzaView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: oreoView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: pizzaView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: stackView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: pizzaView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width))
        view.addConstraint(NSLayoutConstraint(item: pizzaView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height))
        
        let poptartView = StringImageView(frame: CGRectZero)
        poptartView.nameString = "Pop Tart"
        poptartView.image = UIImage(named: "pop_tarts")
        addTapGesture(poptartView)
        stackView.addSubview(poptartView)
        view.addConstraint(NSLayoutConstraint(item: poptartView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: pizzaView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: poptartView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: stackView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: poptartView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width))
        view.addConstraint(NSLayoutConstraint(item: poptartView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height))
        
        let popsicleView = StringImageView(frame: CGRectZero)
        popsicleView.nameString = "Popsicle"
        popsicleView.image = UIImage(named: "popsicle")
        addTapGesture(popsicleView)
        stackView.addSubview(popsicleView)
        view.addConstraint(NSLayoutConstraint(item: popsicleView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: poptartView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: popsicleView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: stackView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: popsicleView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width))
        view.addConstraint(NSLayoutConstraint(item: popsicleView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height))
 
        let ramenView = StringImageView(frame: CGRectZero)
        ramenView.nameString = "Miojo"
        ramenView.image = UIImage(named: "ramen")
        addTapGesture(ramenView)
        stackView.addSubview(ramenView)
        view.addConstraint(NSLayoutConstraint(item: ramenView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: popsicleView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: ramenView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: stackView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: spacing))
        view.addConstraint(NSLayoutConstraint(item: ramenView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width))
        view.addConstraint(NSLayoutConstraint(item: ramenView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height))
        
        stackView.hidden = true
    }
    
    func addTapGesture(view: UIImageView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.addFood(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func addFood(gestureRecognizer: UIGestureRecognizer) {
        let view = gestureRecognizer.view as! StringImageView
        foods.append(view.nameString)
        tableView.reloadData()
    }
    
    func addLabel(string: String) {
        let label = UILabel(frame: CGRectZero)
        label.text = string
        label.font = label.font.fontWithSize(30)
        navBarView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraintEqualToAnchor(navBarView.centerXAnchor).active = true
        label.topAnchor.constraintEqualToAnchor(navBarView.topAnchor, constant: 30).active = true
//        label.widthAnchor.constraintEqualToConstant(100).active = true
//        label.heightAnchor.constraintEqualToConstant(50).active = true
    }
}

class StringImageView: UIImageView {
    var nameString: String = ""
}