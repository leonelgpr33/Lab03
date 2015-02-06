//
//  ViewController.m
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 03/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNuevo:(id)sender {
    [self performSegueWithIdentifier:@"HomeToNuevo" sender:self];
}

- (IBAction)btnEditar:(id)sender {
    [self performSegueWithIdentifier:@"HomeToListado" sender:self];
}

- (IBAction)btnBorrar:(id)sender {
    [self performSegueWithIdentifier:@"HomeToListado" sender:self];
}

- (IBAction)btnListado:(id)sender {
    [self performSegueWithIdentifier:@"HomeToDetalle" sender:self];
}
@end
