include <.\src\libraries\load.scad>
include <.\src\external\load.scad>
include <.\src\load.scad>
//Rehausse
Pieces =0 ; // [0:Autre Piece,20:Réhausse ,100:Ventilateur 80mm ,300:Power iec + inter ,301:Power iec x 2 + inter ,302:Power iec +fuse + inter,341:SSR ,351:MKS_PWC 3.0,400:alimention ,500:Mainboard, 501:Display, 601:Tiroir Simple, 602:Tiroir double, 603:Tiroir Triple]
APieces =0 ; // [0:aucune,1:Jonction entre V-SLOTS,2:Jonction passe cables,100:Couvercle stopswitch x,10:Support moteur Z,200:Support plexyglass + cables,201:verrou cables, 400:outil pour verrou a cable,  601:Tiroir Simple, 602:Tiroir double, 603:Tiroir Triple, 900: aide verrou cable]
//Texture des paroies
Texture = 1; // [1:brique, 2:hex,3:larmes]
//Support pour plexyglass
plexy = 1; // [1:oui, 0:non]
//Repères de fabrication (texte)
FabreP = 1; // [1:oui, 0:non]
//v_slot wide
Larg = 1;// [1:20, 2:40]
Long = 200;
Haut = 70;
/* [Hardware (mainboard display buttons etc)] */
//Carte mêre
MBoard = 0; // [0:MKS Robin 2 v1,1:MKS robin,2:MKS robin Pro, 3:MKS Robin nano 2, 4:MKS Robin nano 3]
//Display type
Display = 0; // [0:MKS TS35-2, 4:MKS Robin 1 & 2]
//Power supply type and model
PSU = 0; // [0:DS-150-24, 1:add you're own]
//Has Slot for SD card
SDSlots = 0; // [0:aucun, 1:MKS SD_slot]
//Solid state relays
SSRelays = 0; // [0:4]
//regulateur de vitesse ventilateur
Fan_c = 1;// [0:4]
// front power button
PWR_button = 1;// [0:non, 1:16mm]

/*[full setup]*/
//Printer 
Prin = 3; // [0:Ne pas afficher,1:CR-10, 3:CR-10S,4:CR-10S4, 5:CR-10S5,2:Ender]
//Presntation
Pres = 0; // [0:Ne pas afficher,1:afficher l'imprimante,2:affciher les pieces de démonstration,3:afficher les pieces et l'imprimante]
// habillage CR-10S
CR10A = [[Haut,Texture,3],[20,0,0],[80,20,0],[200,500,0],[200,341,0],[320,400,0],[160,301,0],[140,351,0],[200,20,0],[160,20,0],[200,501,0]]; 
// habillage CR-10S4
CR10B = [[Haut,Texture,3],[200,20,0],[200,500,0],[200,20,0],[128,20,0],[320,400,0],[160,301,0],[140,100,0],[300,20,0],[228,20,0],[200,501,0]]; 
// habillage CR-10S5
CR10C = [[Haut,Texture,3],[200,20,0],[200,500,0],[300,20,0],[200,20,0],[320,400,0],[160,301,0],[140,351,0],[200,20,0],[200,20,0],[220,20,0],[300,501,0]];


/*[Printing optimistaion]*/
//nozzle (for supports)
Nozzle = 0.4; // [0.1,0.2,0.3,0.4]


/* [Hidden]*/

font = "Liberation Sans";
letter_size = 5;

q = 5;
ri = 0.3;
w2 =  6.4/2-ri;
w1 = 11.0/2-ri;
w0 =     w2;
th =  4.3;
t0 =  2.1+1.8+ri;
t1 =  t0+2.35;
t2 =  t0+th-ri;

	L=300;
    H=450;
    P=460;
/*[hex Pattern Parameters]*/
// in mm:
hex_radius=4;   // [1:20]

// in tens of mm: 
hex_border_width=12; // [2:50]
module alert(al,ob) {
    alert=["Erreur inconnue","Longueur insuffisante", "Hauteur insuffisante", "Longeur exagerée", "Hauteur exagerée","parametre incoherent"];
    echo("msg :",alert[al],"Pour placer",ob);
    echo("msg :",alert[al],"Pour placer",ob);
    echo("msg :",alert[al],"Pour placer",ob);
}
