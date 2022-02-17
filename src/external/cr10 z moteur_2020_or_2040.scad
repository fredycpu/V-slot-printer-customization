/* Name: NEMA17 Motor Bracket for 2020 or 2040
 * Version: 1
 * Author: Jamie Bainbridge <jamie.bainbridge@gmail.com>
 * License: CC BY-SA-4.0 <http://creativecommons.org/licenses/by-sa/4.0/>
 */

// $fn = $preview ? 36 : 180
$fn = 36; // preview: 36, render: 180

// Motor Y adjust ? 0  : 20
motor_slide_Yadj = 0;   // adjustment along Y axis
// Motor Y  ? 0  : 60
motor_Y = 7;   // adjustment along Y axis

// Motor x adjust ? 0  : 20
motor_slide_Xadj = 8;   // adjustment along Y axis    
// Motor x adjust ? 0  : 20
rail_bolt = 5;      // M5
// screws type ? 3  : 6

rail_system = 20;        // 2020 extrusion
// Rail system ? 3  : 6

// https://github.com/openscad/scad-utils
include <scad-utils/morphology.scad>


module mycircle_outer(diameter) {
    rounding(r=diameter/2) square([diameter], center=true);
};

module mycyl_outer(diameter,height) {
    rounding(r=diameter/2) cube([diameter,diameter,height], center=true);
};

module cylinder_outer(diameter,height,fn=24){
    radius = diameter/2;
    fudge = 1/cos(180/fn);
    cylinder(h=height,r=radius*fudge,$fn=fn);}

// NEMA17 Specs
motor_body_width = 42.3;
motor_head_diam = 22;    // circle on top of motor
motor_screw_gap = 31;    // distance between screw holes



plate_thick = 6;
rail_bolt_head = 5;      // M5

plate_width = motor_body_width + plate_thick + motor_slide_Xadj +5;  // along X
plate_depth = motor_body_width + rail_system + plate_thick+ rail_bolt_head + motor_Y;  // along Y
plate_height = rail_system + plate_thick; // along Z

echo(plate_depth = plate_depth);
echo(plate_width = plate_width);

module motor_hole(height) {
    translate([0,0,-1]) linear_extrude(height + 2) {
        union() {
            // motor hole
            translate([(motor_body_width/2)+(motor_slide_Xadj/2),(motor_body_width/2)+(motor_slide_Yadj/2)]) rounding(r=(motor_head_diam/2)-0.5) square([motor_head_diam+motor_slide_Xadj+0.5,motor_head_diam+motor_slide_Yadj+0.5],center=true);

            // motor bolt holes
            inset = (motor_body_width - motor_screw_gap) / 2;
            for (xoffset = [0:1]) {
                for (yoffset = [0:1]) {
                    translate([inset+(motor_slide_Xadj/2)+(motor_screw_gap*xoffset),inset+(motor_slide_Yadj/2)+(motor_screw_gap*yoffset)]) rounding(r=1.5) square([3.5+motor_slide_Xadj,3.5+motor_slide_Yadj], center=true); // 3.5 for M3
                };
            };
        };
    };
};
module Zmotor() {
// angle piece
angle_depth = plate_depth-rail_system-plate_thick;

angle_points = [
    [0,0,0], //0
    [(plate_thick/2),0,0], // 1
    [0,angle_depth,0], //2
    [(plate_thick/2),angle_depth,0], // 3
    [0,angle_depth,rail_system], //4
    [(plate_thick/2),angle_depth,rail_system], //5
];
angle_faces = [
    [0,4,5,1], // front slope
    [2,3,5,4], // back
    [0,2,4],   // left side
    [1,5,3],   // right side
    [0,1,3,2]  // bottom
];

difference() {
    // the bracket
    union() {
        // base
        cube([plate_width,plate_depth,plate_thick]);
        // left slope
        translate([0,0,plate_thick-0]) polyhedron(angle_points,angle_faces);
        // right slope
        translate([plate_width-(plate_thick/2),0,plate_thick-0]) polyhedron(angle_points,angle_faces);
        // back plate
        translate([0,plate_depth-rail_system-plate_thick,0]) cube([plate_width,plate_thick,plate_height]);
        translate([0,plate_depth-13,plate_thick-0]) cube([plate_width,6,5]);
    };

    // motor holes
    #translate([(plate_width - motor_body_width - motor_slide_Xadj) / 2,0,0]) motor_hole(plate_thick);

    // top screw holes
    #translate([0,0,-1]) {
        union () {
            translate([(10),plate_depth-10]) cylinder_outer(rail_bolt +.6,plate_thick+8);
            translate([plate_width-10,plate_depth-10]) cylinder_outer(rail_bolt +.6,plate_thick+8); // 4.6 for M4
        };
    };

    // side screw holes
    #translate([0,-1,0]) rotate ([90,0,0]) {
        union () {
            translate([10, plate_thick+(rail_system-10),-(plate_depth-rail_system+2)]) cylinder_outer(rail_bolt +.6,plate_thick+2);
            translate([plate_width-10, plate_thick+(rail_system-10),-(plate_depth-rail_system+2)]) cylinder_outer(rail_bolt +.6,plate_thick+2);
        };
    };
    // top tensionner
    #translate([0,0,-1]) {    
        translate([plate_width/2+14, 50 ,0]) cylinder_outer(5.3,plate_thick+2);
        translate([plate_width/2+7, 50 ,0]) cylinder_outer(5.3,plate_thick+2);
        translate([plate_width/2, 50 ,0]) cylinder_outer(5.3,plate_thick+2);
        translate([plate_width/2-7, 50 ,0]) cylinder_outer(5.3,plate_thick+2);
        translate([plate_width/2-14, 50 ,0]) cylinder_outer(5.3,plate_thick+2);
        };
};
}


// vim: ft=cpp
