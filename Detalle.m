//
//  Detalle.m
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import "Detalle.h"
#import "AgendaList.h"
#import "DBManager.h"

NSMutableArray *datos;
NSString *idTemp = nil;
int indice = 0;

@interface Detalle ()

@end

@implementation Detalle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControler];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initControler{
     datos = [[DBManager getSharedInstance]listDB:@"select agendaid, nombre, estado, youtube, foto from agenda"];
    self.vermas.enabled=false;
    self.compartir.enabled=false;
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
    [self performSegueWithIdentifier:@"DetalleToHome" sender:self];
}

- (IBAction)btnVermas:(id)sender {
   if (idTemp != nil) {
    [self performSegueWithIdentifier:@"DetalleToVermas" sender:self];
   }
}

- (IBAction)btnCompartir:(id)sender {
    if (idTemp != nil) {
        NSMutableArray *dato = datos[indice];
        NSString *strMsg;
        NSArray *activityItems;
        UIImage *imgShare;
        UIActivityViewController *actVC;
        imgShare = [UIImage imageWithData:[dato objectAtIndex:4]];
        strMsg = [NSString stringWithFormat: @"He compartido un contacto contigo, se llama %@ y su estado es: %@.", [dato objectAtIndex:1], [dato objectAtIndex:2]];
        activityItems = @[imgShare, strMsg];
        //Init activity view controller
        actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
        [self presentViewController:actVC animated:YES completion:nil];
    }
}

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [datos count];
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AgendaList";
    AgendaList *cell = (AgendaList *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[AgendaList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSMutableArray *dato = datos[indexPath.row];
    cell.lblNombre.text = [dato objectAtIndex:1];
    cell.lblEstado.text = [dato objectAtIndex:2];
    cell.imgFoto.image = [UIImage imageWithData:[dato objectAtIndex:4]];
    CALayer * l = [cell.imgFoto layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:30.0];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *dato = datos[indexPath.row];
    indice = indexPath.row;
    idTemp = [dato objectAtIndex:0];
    self.lblTitulo.text = [dato objectAtIndex:1];
    self.vermas.enabled=true;
    self.compartir.enabled=true;
}

@end
