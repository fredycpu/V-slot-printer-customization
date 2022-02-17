module Printer() {
	PL=400;
    PH=150;
    PP=460;
if (Prin == 1)  {
    PL = 400;
    PH = 550;
    PP = 460;

    color("blue") translate([0,PP/2+20,20]) rotate([90,90,0]) V20x40_6(500);        
    color("brown") translate([-PL/2,0,PH/2]) rotate([0,90,0]) V20x20_6(414);
    chassis(PL,PP,PH,60);
}
if (Prin == 3)  {
    PL = 400;
    PH = 550;
    PP = 460;

    color("blue") translate([0,PP/2+20,20]) rotate([90,90,0]) V20x40_6(500);        
    color("brown") translate([-PL/2,0,PH/2]) rotate([0,90,0]) V20x20_6(414);
    chassis(PL,PP,PH,60);
}
    
    if (Prin == 4) {
    PL=508;
    PH=550;
    PP=560;
    color("blue")  union() {
    translate([100,PP/2+20,20]) rotate([90,90,0]) V20x40_6(600);
    translate([-100,PP/2+20,20]) rotate([90,90,0]) V20x40_6(600);
        }
    color("brown")  translate([-PL/2,0,PH/2]) rotate([0,90,0]) V20x20_6(523);
            
    chassis(PL,PP,PH,60);
    
    }
if (Prin == 5) {
    PL=600;
    PH=750;
    PP=660;
    color("blue")  union() {
    translate([100,PP/2+20,20]) rotate([90,90,0]) V20x40_6(700);
    translate([-100,PP/2+20,20]) rotate([90,90,0]) V20x40_6(700);
        }
    color("brown")  translate([-PL/2,0,PH/2]) rotate([0,90,0]) V20x20_6(597);
            
    chassis(PL,PP,PH,60);
    
    }
    
    

    
}

module chassis(L,P,H,Dec) {
    color("blue") union() {
    translate([-L/2,(P+20)/2]) rotate([0,90,0]) V20x20_6(L);
    translate([-L/2,-(P+20)/2]) rotate([0,90,0]) V20x20_6(L);
    translate([-(L/2-20),P/2]) rotate([90,90,0]) V20x40_6(P);
    translate([(L/2-20),P/2]) rotate([90,90,0]) V20x40_6(P);
    translate([0,Dec,0]) union() {
    translate([-L/2,0,H+20]) rotate([0,90,0]) V20x20_6(L);
    translate([-(L/2-20),0,10]) rotate([0,0,90]) V20x40_6(H);
    translate([(L/2-20),0,10]) rotate([0,0,90]) V20x40_6(H);
    }
}
}
module full_setup(pas , Ppos) {
    STexture=Texture;
    if (Prin == 3 || Prin == 1) {
        if (pas < len(CR10A)) {
    SHaut = CR10A[0][0];
    STexture = CR10A[0][1];
    if (Ppos<500) { translate([-180,-240+Ppos,-10]) Rehausse(40,CR10A[pas][0],SHaut,STexture,CR10A[pas][1]);} else
    if (Ppos<820) { translate([-150+Ppos-500,230,-10]) rotate([0,0,270]) Rehausse(20,CR10A[pas][0],SHaut,STexture,CR10A[pas][1]);}else
    if (Ppos<1320) { translate([180,240-(Ppos-820),-10]) rotate([0,0,180])
    Rehausse(40,CR10A[pas][0],SHaut,STexture,CR10A[pas][1]);} else
    if (Ppos<1640) { translate([150-(Ppos-1320),-230,-10]) rotate([0,0,90])
    Rehausse(20,CR10A[pas][0],SHaut,STexture,CR10A[pas][1]);}
    full_setup(pas + 1, Ppos+ CR10A[pas][0]);
    }
    }
    if (Prin == 4) {
        if (pas < len(CR10B)) {
    SHaut = CR10B[0][0];
    STexture = CR10B[0][1];
    if (Ppos<600) { translate([-234,-290+Ppos,-10]) Rehausse(40,CR10B[pas][0],SHaut,STexture,CR10B[pas][1]);} else
    if (Ppos<1048) { translate([-204+Ppos-600,280,-10]) rotate([0,0,270]) Rehausse(20,CR10B[pas][0],SHaut,STexture,CR10B[pas][1]);}else
    if (Ppos<1648) { translate([234,290-(Ppos-1048),-10]) rotate([0,0,180])
    Rehausse(40,CR10B[pas][0],SHaut,STexture,CR10B[pas][1]);} else
    if (Ppos<2198) { translate([204-(Ppos-1648),-280,-10]) rotate([0,0,90])
    Rehausse(20,CR10B[pas][0],SHaut,STexture,CR10B[pas][1]);}
    full_setup(pas + 1, Ppos+ CR10B[pas][0]);
    }
    }
    if (Prin == 5 ) {
        if (pas < len(CR10C)) {
    SHaut = CR10C[0][0];
    STexture = CR10C[0][1];
    if (Ppos<700) { translate([-280,-340+Ppos,-10]) Rehausse(40,CR10C[pas][0],SHaut,STexture,CR10C[pas][1]);} else
    if (Ppos<1220) { translate([-250+Ppos-700,330,-10]) rotate([0,0,270]) Rehausse(20,CR10C[pas][0],SHaut,STexture,CR10C[pas][1]);}else
    if (Ppos<1920) { translate([280,340-(Ppos-1220),-10]) rotate([0,0,180])
    Rehausse(40,CR10C[pas][0],SHaut,STexture,CR10C[pas][1]);} else
    if (Ppos<2620) { translate([250-(Ppos-1920),-330,-10]) rotate([0,0,90])
    Rehausse(20,CR10C[pas][0],SHaut,STexture,CR10C[pas][1]);}
    full_setup(pas + 1, Ppos+ CR10C[pas][0]);
    }
    }
}


