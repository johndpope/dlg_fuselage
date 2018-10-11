/**
* bezier_surface.scad
*
* Given a set of control points, the bezier_surface function returns points of the Bézier surface. 
* Combined with the function_grapher module defined in my lib-openscad, 
* you can create a Bézier surface.
*
* It depends on the bezier_curve function so remember to include bezier_curve.scad.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-bezier_surface.html
*
**/ 

function bezier_surface(t_step, ctrl_pts) =
    let(pts =  [
        for(i = [0:len(ctrl_pts) - 1]) 
            bezier_curve(t_step, ctrl_pts[i])
    ]) 
    [for(x = [0:len(pts[0]) - 1]) 
        bezier_curve(t_step,  
                [for(y = [0:len(pts) - 1]) pts[y][x]]
        ) 
    ];