//
//  Detalle.h
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>

@interface Detalle : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

//Outlets
@property (strong, nonatomic) IBOutlet UITableView *tblDatos;
@property (strong, nonatomic) IBOutlet UILabel *lblTitulo;

//Actiones
- (IBAction)btnRegresar:(id)sender;
- (IBAction)btnVermas:(id)sender;
- (IBAction)btnCompartir:(id)sender;

@end
