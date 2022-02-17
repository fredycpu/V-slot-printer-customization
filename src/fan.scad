module PCB_vent(Gx,Gy,SD=-1,MSD=-1,UA=-1) {
}
module Ventil(Vx,Vy,Vz,Vsize) {
    difference() {
        union() {
    translate([0,0,-6])cube([40,Vy,Vz+12]);
    difference () {
        intersection() {
        translate([0,-10+(Vy-Vsize)/2,-6]) cube([Vsize+50,Vsize+20,Vz+12]);
        translate([Vx+20,Vy/2,30]) sphere(70);
        }
        translate([Vx+40,Vy/2,38]) sphere(82/2);
        translate([40,-10.5+(Vy-Vsize)/2,70-40])    cube([Vsize+41,Vsize+21,Vz+10]);
    }
}
difference () {        
    translate([-5,Vy/2,Vz/2-2]) scale ([1,1.10,0.80]) rotate([0,97,0])cylinder(h=80,r=50/2,r1=65/2,$fn=80);
    //translate([0,Vy/2,Vz/2]) rotate([90,0,90]) hexpattern(Vy,Vz, 10);
   }
translate([10,Vy-10,-7]) cylinder(h=Vz+1,r=10/2,$fn=80); 
translate([30,Vy-10,-7]) cylinder(h=Vz+1,r=10/2,$fn=80); 
translate([30,10,-7]) cylinder(h=Vz+1,r=10/2,$fn=80); 
   translate([10,10,-7]) cylinder(h=Vz+1,r=10/2,$fn=80); 
 for (i=[-1:2:1]) {
            for (j=[-1:2:1]) {
                // screw holes
            translate([80+i*72.5/2,40+(Vy-Vsize)/2+j*72.5/2,20]) cylinder(25,6/2,6/2,true);
           translate([80+i*72.5/2,40+(Vy-Vsize)/2+j*72.5/2,0]) cylinder(56,10/2,10/2,true);
                }
            }
        }
    
}
