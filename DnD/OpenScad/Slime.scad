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
//Slime body diameter in mm
bodyD = 19;

//Mouth size of the slime in mm
mouth = 5;

/* [Misc.] */
//Determine how nice round parts are
resolution = 360;

bottom = hasBase ? baseHeight : 0;

$fn = resolution;

//begin modelling
union(){
    if(hasBase){
        cylinder(h = baseHeight, d = baseD, center = false);
    }
    translate([0, 0, bottom + 4]){
        difference(){
            sphere(d = bodyD);
            translate([0,0,-7]){
                cube([bodyD, bodyD, 6], center = true);
            }
            translate([bodyD / 2, 0,0]){
                scale([0.5,1,0.5]){
                    sphere(d = mouth);
                }
            }
        }
        
    }
}