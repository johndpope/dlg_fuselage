/**
* shape_pentagram.scad
*
* Returns shape points of a pentagram.
* They can be used with xxx_extrude modules of dotSCAD.
* The shape points can be also used with the built-in polygon module. 
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-shape_ellipse.html
*
**/

function shape_pentagram(r) =
    [
        [0, 1], [-0.224514, 0.309017], 
        [-0.951057, 0.309017], [-0.363271, -0.118034], 
        [-0.587785, -0.809017], [0, -0.381966], 
        [0.587785, -0.809017], [0.363271, -0.118034], 
        [0.951057, 0.309017], [0.224514, 0.309017]
    ] * r;