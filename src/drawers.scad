module Tiroir(Bx,By,Bz,Btype) {
        
  difference () {
      union () {
    translate([0,0,-6])cube([7,By,Bz+12]);
    translate([7,0,-6])cube([33,By,5]);


    if (Btype == 2 ) {// MKS Robin Pro
    translate([7,DecY,-6])pcb_implentation(84,BoardW,76,135);
    }
    if (Btype == 0 || Btype== 1) {// MKS Robin 2 V1.0
    translate([7,DecY,-6])pcb_implentation(100,BoardW,92,142);
    }
      }
    if (Btype == 1) {// MKS Robin V2.4
    translate([0,DecY+BoardW,5]) PCB_connect(-32.5,-63.5,-1,-1);
    }
    if (Btype == 2) {// MKS Robin PRO
    translate([0,DecY+BoardW,5]) PCB_connect(-32.5,-69.6);
    }
    if (Btype == 0 ) {// MKS Robin 2 V1.0        
    translate([0,DecY+BoardW,5]) PCB_connect(-32.5,-63.5,-1,-86);


    translate([0,DecY+BoardW,5]) difference () {        
    union() {
    translate([-0.1,-112,0]) cube([20,22,20]);
    translate([-0.1,-112,15]) cube([20,112,20]);
    }
    translate([2,-100,11]) rotate([90,0,90]) hexpattern(200,60, 10);
   }  
 }
 
 
    translate([55,By/2,-8])cylinder(h=10,d=80,$fn=8);
 
 
 
    translate([10,10,Bz-25]) cylinder(h=25,r=10/2,$fn=80);  
    translate([10,By-10,Bz-25]) cylinder(h=25,r=10/2,$fn=80);
  } 
  
}
