module pcb_support(he=5,d1=8,d2=3) {
    difference () {
    cylinder(h=he,d=d1,$fn=80);
    translate([0,0,-0.1])cylinder(h=he+0.2,d=d2,$fn=80);
    }
}
module pcb_implentation(Pl,Pw,Hl,Hw,he=5,d1=7,d2=3) {
    cube([Pl,Pw,5]);
    translate([4,(Pw-Hw)/2,5]) pcb_support(he,d1,d2);
    translate([4,(Pw-Hw)/2+Hw,5]) pcb_support(he,d1,d2);
    translate([4+Hl,(Pw-Hw)/2,5]) pcb_support(he,d1,d2);
    translate([4+Hl,(Pw-Hw)/2+Hw,5]) pcb_support(he,d1,d2);   
}
