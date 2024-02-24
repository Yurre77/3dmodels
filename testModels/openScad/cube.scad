//@Description: model of a testing cube
//@Author: Yurre
//@Version: 1

//Size of the cube in mm
cubeSize = 10;

translate([0,0, cubeSize / 2]){
    cube(cubeSize, center = true);
}