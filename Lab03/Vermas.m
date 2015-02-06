//
//  Vermas.m
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import "Vermas.h"

NSString *idTemp;

@interface Vermas ()

@end

@implementation Vermas

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initController{
    NSMutableArray *dato = [[DBManager getSharedInstance]consultaDB:[NSString stringWithFormat: @"select agendaid, nombre, estado, youtube, foto FROM agenda WHERE agendaid=%@;", idTemp]];
    self.lblNombre.text = [dato objectAtIndex:1];
    self.lblEstado.text = [dato objectAtIndex:2];
    self.imgPhoto.image = [UIImage imageWithData:[dato objectAtIndex:4]];
    NSURL *url = [NSURL URLWithString:[dato objectAtIndex:3]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webVideo loadRequest:request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnRegresar:(id)sender {
    [self performSegueWithIdentifier:@"VermasToDetalle" sender:self];
}
@end
