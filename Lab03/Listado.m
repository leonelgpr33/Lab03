//
//  Listado.m
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import "Listado.h"
#import "AgendaList.h"
#import "DBManager.h"

NSMutableArray *datos;
//NSString *idTempL = nil;
//int indice = 0;


@interface Listado ()

@end

@implementation Listado

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self initControler];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initControler{
    datos = [[DBManager getSharedInstance]listDB:@"select agendaid, nombre, estado, youtube, foto from agenda"];
    [self.tblDatos reloadData];
    self.editar.enabled=false;
    self.eliminar.enabled=false;
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
    [self performSegueWithIdentifier:@"ListadoToHome" sender:self];
}

- (IBAction)btnEditar:(id)sender {
    [self performSegueWithIdentifier:@"ListadoToNuevo" sender:self];
}




- (IBAction)btnEliminar:(id)sender {
    datos = [[DBManager getSharedInstance]executeQueryWithString:[[NSString alloc] initWithFormat: @"delete from agenda where agendaid=%@",idTemp]];
    [self initControler];
    [self.tblDatos reloadData];
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
    static NSString *CellIdentifier = @"ListCel";
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
    //int indice = 0;
    NSMutableArray *dato = datos[indexPath.row];
    //indice = indexPath.row;
    idTemp = [dato objectAtIndex:0];
    self.editar.enabled=true;
    self.eliminar.enabled=true;
}

@end
