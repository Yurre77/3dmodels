//@Model: Slime
//@Author: Yurre
//@Version: 1

/* [Base] */
//Determine whether or not the character has a round base
hasBase = true;

//Base height in mm
baseHeight = 3.0;

//Base diameter in mm
baseD = 20.0;

/* [Misc.] */
//Determine how nice round parts are
resolution = 360;


$fn = resolution;

//begin modelling
if(hasBase){
    cylinder(h = baseHeight, d = baseD, center = false);
}