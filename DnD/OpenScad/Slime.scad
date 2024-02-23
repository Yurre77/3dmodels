//@Model: Slime
//@Author: Yurre
//@Version: 1

/* [Base] */
//Determine whether or not the character has a round base
hasBase = true;

//Base height in mm
baseHeight = 2.5;

//Base diameter in mm
baseD = 20.0;

/* [Slime] */


/* [Misc.] */
//Determine how nice round parts are
resolution = 360;

bottom = hasBase ? baseHeight : 0;

$fn = resolution;

//begin modelling
if(hasBase){
    cylinder(h = baseHeight, d = baseD, center = false);
}
translate([0, 0, bottom]){
    
}

translate([0, 50, 0]){
    difference(){
        sphere(d = 19);
        translate([0,0,-7]){
            cube([19, 19, 6], center = true);
        }
    }
}