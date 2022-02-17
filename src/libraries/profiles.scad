module slot_6() {


    hull() {
        translate([ t0, -w0]) circle(r=ri, $fn=5*q);
        translate([ t0,  w0]) circle(r=ri, $fn=2*q);
        translate([ t1, -w1]) circle(r=ri, $fn=2*q);
        translate([ t1,  w1]) circle(r=ri, $fn=2*q);
        translate([ t2, -w1]) circle(r=ri, $fn=2*q);
        translate([ t2,  w1]) circle(r=ri, $fn=2*q);
    }  
    translate([ t0-0.3, 0]) circle(r=0.5, $fn=5*q);    
}
module vSlot_6() {
    slot_6();
    difference() {
        translate([ t2+5,  0]) square([10,10], center=true);
        groove();
        mirror([0,1]) groove();
    }
}

module profile20x20_6V() {  // 20x20mm profile 6mm Vslot
    le = 20/2;
    difference() {
        hull() {
            translate([-le+0.5,-le+0.5]) circle(r=0.5, $fn=2*q);
            translate([-le+0.5, le-0.5]) circle(r=0.5, $fn=2*q);
            translate([ le-0.5,-le+0.5]) circle(r=0.5, $fn=2*q);
            translate([ le-0.5, le-0.5]) circle(r=0.5, $fn=2*q);
        }   
        circle(d=4.2, $fn=3*q);
        for(i=[0:3]) rotate(90*i) vSlot_6();
    }    
}

module profile40x40_6V() {  // 40x40mm profile 6mm Vslot
    le = 40/2;
    difference() {
        hull() {
            translate([-le+2,-le+2]) circle(r=2, $fn=3*q);
            translate([-le+2, le-2]) circle(r=2, $fn=3*q);
            translate([ le-2,-le+2]) circle(r=2, $fn=3*q);
            translate([ le-2, le-2]) circle(r=2, $fn=3*q);
        }   
        for(i=[0:3]) {
            rotate(90*i) translate([ le/2, le/2]) circle(d=4.6, $fn=3*q);
            rotate(90*i) translate([ le/2, le/2]) vSlot_6();
            rotate(90*i) translate([ le/2,-le/2]) vSlot_6();
            rotate(90*i) translate([-le/2, le/2])  slot_6();
            rotate(90*i) translate([-le/2,-le/2])  slot_6();
        }
        square([le*0.35, le*1.85],center=true);
        square([le*1.85, le*0.35],center=true);
        rotate(45) square(le*0.93,center=true);
    }
}
module profile20x40_6V() {  // 20x40mm profile 6mm Vslot
    le = 20/2;
    lE = 40/2;
    difference() {
        hull() {
            translate([-le+0.5,-lE+0.5]) circle(r=0.5, $fn=2*q);
            translate([-le+0.5, lE-0.5]) circle(r=0.5, $fn=2*q);
            translate([ le-0.5,-lE+0.5]) circle(r=0.5, $fn=2*q);
            translate([ le-0.5, lE-0.5]) circle(r=0.5, $fn=2*q);
        }   
         translate([ 0, lE/2]) circle(d=4.2, $fn=3*q);
        translate([ 0, -lE/2]) circle(d=4.2, $fn=3*q);
        for(i=[0:2]) {
        translate([ 0, lE/2]) rotate(90*i) vSlot_6();
        translate([ 0, -lE/2]) rotate(180+90*i) vSlot_6();
    }
    rotate(45) square([le*1.25, le*0.48],center=true);
    rotate(-45) square([le*1.25, le*0.48],center=true);
    
    square([le*1.70, le*0.55],center=true);
    square([le*0.54, le*1.22],center=true);
    
    
    }    
    
    
}
module V20x20_6(h) {
    linear_extrude(height=h)
    profile20x20_6V();
}

module V40x40_6(h) {
    linear_extrude(height=h)
    profile40x40_6V();
}
module V20x40_6(h) {
    linear_extrude(height=h)
    profile20x40_6V();
}

module groove() {
    hull() {
        translate([ t2+2*ri,  w2+2*ri]) circle(r=ri, $fn=2*q);
        translate([ t2+2*ri+5,  w2+2*ri+5]) circle(r=ri, $fn=2*q);
        translate([ t2+2*ri,  10]) circle(r=ri, $fn=3);
    }
}

