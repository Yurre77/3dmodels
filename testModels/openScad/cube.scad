//@Description: model of a testing cube
//@Author: Yurre
//@Version: 1

//Size of the cube in mm
cubeSize = 10;

translate([0,0, cubeSize / 2]){
    difference(){
        cube(cubeSize, center = true);
        translate([0,-(cubeSize / 3), (cubeSize / 2) - 0.5]){
            linear_extrude(2){
                text("Z", size = cubeSize / 1.5, halign = "center");
            }
        }
        translate([0,( cubeSize / 2) - 0.5, -(cubeSize / 3)]){
            rotate([270, 180, 0]){
                linear_extrude(2){
                    text("Y", size = cubeSize / 1.5, halign = "center");
                }
            }
        }
        translate([(cubeSize / 2) - 0.5, 0, -(cubeSize / 3)]){
            rotate([90, 0, 90]){
                linear_extrude(2){
                    text("X", size = cubeSize / 1.5, halign = "center");
                }
            }
        }
    }
}