//@Model: Slime
//@Author: Yurre
//@Version: 1

/* [Base] */
//Determine whether or not the character has a round base
hasBase = true;

//Base height in mm
baseHeight = 2.5;

//Base diameter in mm
baseD = 19.9;

/* [Slime] */
//Slime body diameter in mm
bodyD = 19.1;

//Determine whether it has a mouth or not
hasMouth = true;

//Mouth size of the slime in mm
mouth = 5.1;

//Mouth depth scale modifier
mouthDepth = 0.5;

//Mouth height modifier
mouthMod = 0.5;

//Adjust the position of the mouth on the Z axis
mouthZ = 0.1;

/* [Eyes] */
//determine whether the slime has a middle eye
hasMEye = false;

//Determine middle eye diameter in mm
mEyeSize = 4;

//Adjust middle eye position on the X axis in mm
mEyeX = 6.4;

//Adjust the middle eye position on the Y axis in mm
mEyeY = 0.1;

//Adjust the middle eye position on the Z axis in mm
mEyeZ = 6.9;

//Determine whether the slime has the right eye or not
hasREye = true;

//Determine the size of the right eye in mm
rEyeSize = 4;

//Adjust the position of the right eye on the X axis in mm
rEyeX = 5.5;

//Adjust the position of the right eye on the Y axis in mm
rEyeY = 5.1;

//Adjust the position of the right eye on the Z axis in mm
rEyeZ = 6.9;

//Angle of the right eye in degrees
rEyeR = 45;

//Determine whether the slime has the left eye or not
hasLEye = true;

//Determine the size of the left eye in mm
lEyeSize = 4;

//Adjust the position of the left eye on the X axis in mm
lEyeX = 5.5;

//Adjust the position of the left eye on the Y axis in mm
lEyeY = -5.1;

//Adjust the position of the left eye on the Z axis in mm
lEyeZ = 6.9;

//Angle of the left eye in degrees
lEyeR = 45;

/* [Misc.] */
//Determine how nice round parts are
resolution = 360;

//Determine whether to put text on the bottom or not
hasText = true;

//Determine the text
bText = "Slime";

//Determine the size of the text
bTextSize = 2.5;

bottom = hasBase ? baseHeight : 0;

$fn = resolution;

//begin modelling
difference(){
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
                if(hasMouth){
                    translate([bodyD / 2, 0,mouthZ]){
                        scale([mouthDepth,1,mouthMod]){
                            sphere(d = mouth);
                        }
                    }
                }
            }
            if(hasMEye){
                translate([mEyeX, mEyeY, mEyeZ]){
                    difference(){
                        sphere(d = mEyeSize);
                        translate([mEyeSize / 2, 0, 0]){
                            sphere(d=mEyeSize / 5);
                        }
                    }
                }
            }
            if(hasREye){
                translate([rEyeX, rEyeY, rEyeZ]){
                    difference(){
                        rotate([-rEyeR, 0, 0]){
                            scale([1,0.75,1]){
                                sphere(d=rEyeSize);
                            }
                        }
                        translate([rEyeSize / 2, 0, 0]){
                            sphere(d=rEyeSize / 5);
                        }
                    }
                }
            }
            if(hasLEye){
                translate([lEyeX, lEyeY, lEyeZ]){
                    difference(){
                        rotate([lEyeR, 0, 0]){
                            scale([1,0.75,1]){
                                sphere(d=lEyeSize);
                            }
                        }
                        translate([lEyeSize / 2, 0, 0]){
                            sphere(d=lEyeSize / 5);
                        }
                    }
                }
            }
        }
    }
    if(hasText){
        translate([0,-1,0]){
            linear_extrude(2, center = true){
                text(bText, bTextSize, halign = "center");
            }
        }
    }
}